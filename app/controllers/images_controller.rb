class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    params[:query] = '' if params[:query] == 'Search'
    # @images = Image.page params[:page]
      @images = Image.includes(:image_type).where("\"ImageFileLocation\" ilike ? or \"ImageDescription\" ilike ? or \"Institution\" ilike ? or \"CatalogueNumber\" ilike ? or \"tblImageType\".\"ImageType\" ilike ?","%#{params[:query]}%", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%").order('"ImageID"').page(@page).per(@per_page)
      # debugger
      @total = Image.includes(:image_type).where("\"ImageFileLocation\" ilike ? or \"ImageDescription\" ilike ? or \"Institution\" ilike ? or \"CatalogueNumber\" ilike ? or \"tblImageType\".\"ImageType\" ilike ?","%#{params[:query]}%", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%").count
      @total_pages = Image.includes(:image_type).where("\"ImageFileLocation\" ilike ? or \"ImageDescription\" ilike ? or \"Institution\" ilike ? or \"CatalogueNumber\" ilike ? or \"tblImageType\".\"ImageType\" ilike ?","%#{params[:query]}%", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%").count / @per_page.to_i + 1

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @image = Image.new

    respond_to do |format|
      format.html { render 'edit'}
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
    @images_in_project = Image.joins(:projects).where("\"tblProject\".\"ProjectID\" = '#{(@image.projects.first != nil ? @image.projects.first.ProjectID.to_str : '')}'")
    # @image.EditorID = current_user.editor_id
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    @images_in_project = Image.joins(:projects).where("\"tblProject\".\"ProjectID\" = '#{(@image.projects.first != nil ? @image.projects.first.ProjectID.to_str : '')}'")
    @image.EditorIDN = current_user.editor_id
    @image.DateAdded = Time.now
    respond_to do |format|
      if @image.save
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @image.id, :activity => "Created Image #{@image.ImageID}")
        format.html { redirect_to edit_image_path(@image), notice: 'Image was successfully created.' }
        format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])
    @images_in_project = Image.joins(:projects).where("\"tblProject\".\"ProjectID\" = '#{(@image.projects.first != nil ? @image.projects.first.ProjectID.to_str : '')}'")
    @image.EditorID = current_user.editor_id
    respond_to do |format|    
      if @image.update(image_params)
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @image.id, :activity => "Updated Image #{@image.ImageID}")
        format.html { redirect_to edit_image_path(@image), notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: 'uh oh' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @image.id, :activity => "Deleted Image #{@image.ImageID}")
    @image.destroy

    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end
  
  def add_projects
    num = 0
    Image.joins(:beads).each do |image|
      image.beads.each do |bead|
        if !image.projects.include?(bead.project)
          image.projects << bead.project
          num += 1
        end
      end
    end
    Image.joins(:buttons).each do |image|
      image.buttons.each do |o|
        if !image.projects.include?(o.project)
          image.projects << o.project
          num += 1
        end
      end
    end
    Image.joins(:buckles).each do |image|
      image.buckles.each do |o|
        if !image.projects.include?(o.project)
          image.projects << o.project
          num += 1
        end
      end
    end
    Image.joins(:glasses).each do |image|
      image.glasses.each do |o|
        if !image.projects.include?(o.project)
          image.projects << o.project
          num += 1
        end
      end
    end
    Image.joins(:gen_artifacts).each do |image|
      image.gen_artifacts.each do |o|
        if !image.projects.include?(o.project)
          image.projects << o.project
          num += 1
        end
      end
    end
    Image.joins(:tobacco_pipes).each do |image|
      image.tobacco_pipes.each do |o|
        if !image.projects.include?(o.project)
          image.projects << o.project
          num += 1
        end
      end
    end
    Image.joins(:utensils).each do |image|
      image.utensils.each do |o|
        if !image.projects.include?(o.project)
          image.projects << o.project
          num += 1
        end
      end
    end
    Image.joins(:contexts).each do |image|
      image.contexts.each do |o|
        if !image.projects.include?(o.project)
          image.projects << o.project
          num += 1
        end
      end
    end
    Image.joins(:project_site_maps).each do |image|
      image.project_site_maps.each do |o|
        if !image.projects.include?(o)
          image.projects << o
          num += 1
        end
      end
    end
    render text: "#{num} projects added"
  end
  
  def download
    image = Image.find(params[:id])
    send_file image.ImageFileLocation
  end
  
  private
  
  def image_params
    params.require(:image).permit(:ImageFileLocation ,:ImageTypeID, :ImageSubtypeID, :ImageFormID, :ImageFileFormatID, :ImageMaterialID,  :ImageDescription, :InstitutionID, :ImageCitation, :CatalogueNumber, :DocumentID, :photo, :project_ids => [])
  end
  
end
