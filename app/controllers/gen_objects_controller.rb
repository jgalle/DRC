class GenObjectsController < ApplicationController
  # GET /gen_objects
  # GET /gen_objects.json
  def index
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    params[:query] = '' if params[:query] == 'Search'
    # if current_user.user_level >= 3
    @projects = current_user.projects.map{|p| p.ProjectID}
    # debugger
    query = (params[:query] != nil and params[:query] != '') ? params[:query] : '%'
    query.gsub!('*','%')
    if params[:artifacts] != 'my_artifacts'
      @total = GenObject.where("cast(\"ObjectID\" as text) ilike ? or \"InstitutionalObjectNumber\" ilike ?","#{query}", "#{query}").count
      @total_pages = GenObject.where("cast(\"ObjectID\" as text) ilike ? or \"InstitutionalObjectNumber\" ilike ?","#{query}", "#{query}").count / @per_page.to_i + 1
      @gen_objects = GenObject.where("cast(\"ObjectID\" as text) ilike ? or \"InstitutionalObjectNumber\" ilike ?","#{query}","#{query}").order('"ObjectID"').page(params[:page]).per(@per_page)
    else
      @total = GenObject.where("(cast(\"ObjectID\" as text) ilike ? or \"InstitutionalObjectNumber\" ilike ?) and \"EditorIDN\" = ?","#{query}","#{query}",current_user.editor_id).count
      @total_pages = GenObject.where("(cast(\"ObjectID\" as text) ilike ? or \"InstitutionalObjectNumber\" ilike ?) and \"EditorIDN\" = ?","#{query}","#{query}", current_user.editor_id).count / @per_page.to_i + 1
      @gen_objects = GenObject.where("(cast(\"ObjectID\" as text) ilike ? or \"InstitutionalObjectNumber\" ilike ?) and \"EditorIDN\" = ?","#{query}","#{query}",current_user.editor_id).order('"ObjectID"').page(params[:page]).per(@per_page)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_objects }
    end
  end

  # GET /gen_objects/1
  # GET /gen_objects/1.json
  def show
    @gen_object = GenObject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_object }
    end
  end

  # GET /gen_objects/new
  # GET /gen_objects/new.json
  def new
    @gen_object = GenObject.new
    @in_context = []
    if params[:context_sample] != nil
      gca = GenerateContextArtifact.create(:ContextSampleID => params[:context_sample], :ObjectID => '0')
      @in_context = GenObject.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = ?", params[:context_sample]).order('"ObjectID"')
      @gen_object.generate_context_artifact = gca
    end

    respond_to do |format|
      format.html { render 'edit'}
      format.json { render json: @gen_object }
    end
  end

  # GET /gen_objects/1/edit
  def edit
    @gen_object = GenObject.find(params[:id])
    @objects_in_project = GenObject.where("\"ProjectID\" = '#{@gen_object.ProjectID}'")
    @in_context = []
    # @images = Image.limit(100).order(:ImageID)
    @images = Image.joins(:projects).where('"tblProject"."ProjectID" = ?', @gen_object.ProjectID).limit(100).order('"DateAdded" desc')
    @projects = current_user.projects.map{|p| p.ProjectID}
    
    @project_id = @gen_object.ProjectID
    # if @gen_object.context_sample != nil
      # @in_context = GenObject.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@gen_object.context_sample.ContextSampleID}'").order('"ObjectID"')
    # end
  end

  # POST /gen_objects
  # POST /gen_objects.json
  def create
    @gen_object = GenObject.new(gen_object_params)
    @objects_in_project = GenObject.where("\"ProjectID\" = '#{@gen_object.ProjectID}'")
    @gen_object.EditorIDN = current_user.editor_id
    @projects = current_user.projects.map{|p| p.ProjectID}
    @in_context = []
    # @images = Image.limit(100).order(:ImageID)
    @images = Image.joins(:projects).where('"tblProject"."ProjectID" = ?', @gen_object.ProjectID).limit(100).order('"DateAdded" desc')
    # if @gen_object.context_sample != nil
    #   @in_context = GenObject.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@gen_object.context_sample.ContextSampleID}'").order('"ObjectID"')
    # end

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @gen_object.save
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @gen_object.id, :activity => "Created #{@gen_object.ObjectID}")
        format.html { redirect_to edit_gen_object_path(@gen_object, anchor: anchor), notice: 'Gen artifact was successfully created.' }
        format.json { render json: @gen_object, status: :created, location: @gen_object }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_objects/1
  # PUT /gen_objects/1.json
  def update
    @gen_object = GenObject.find(params[:id])
    @objects_in_project = GenObject.where("\"ProjectID\" = '#{@gen_object.ProjectID}'")
    @gen_object.EditorID = current_user.editor_id
    @in_context = []
    @projects = current_user.projects.map{|p| p.ProjectID}
    # @images = Image.limit(100).order(:ImageID)
    @images = Image.joins(:projects).where('"tblProject"."ProjectID" = ?', @gen_object.ProjectID).limit(100).order('"DateAdded" desc')
    # if @gen_object.context_sample != nil
    #   @in_context = GenObject.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@gen_object.context_sample.ContextSampleID}'").order('"ObjectID"')
    # end
    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @gen_object.update(gen_object_params)
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @gen_object.id, :activity => "Updated #{@gen_object.ObjectID}")
        format.html { redirect_to edit_gen_object_path(@gen_object, anchor: anchor), notice: 'Gen artifact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_objects/1
  # DELETE /gen_objects/1.json
  def destroy
    @gen_object = GenObject.find(params[:id])
    activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @gen_object.id, :activity => "Deleted #{@gen_object.ObjectID}")
    @gen_object.destroy

    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to gen_objects_url }
      format.json { head :no_content }
    end
  end
  
  def duplicate
    orig = GenObject.find(params[:id])
    gca = GenerateContextArtifact.new
    gca.ObjectID = '0'
    gca.context_sample = orig.context_sample
    # gca.save
    # max_artifact_id = GenerateContextArtifact.where('ContextSampleID' => orig.context_sample).maximum('ObjectID')
    # if max_artifact_id != nil
    #   max_artifact_id = max_artifact_id.split('-').last.to_i + 1
    # else
    #   max_artifact_id = 1
    # end
    # gca.ObjectID = "#{gca.ContextSampleID.gsub(';','')}-#{max_artifact_id.to_s.rjust(5,'0')}"
    gca.save
    @gen_object = GenObject.new
    @gen_object.generate_context_artifact = gca
    # @gen_object.generate_context_artifact.save
    @gen_object.GenerateContextObjectID = @gen_object.generate_context_artifact.id
    @gen_object.EditorIDN = current_user.editor_id
    @gen_object.ProjectNameID = orig.ProjectNameID
    @gen_object.InstitutionID = orig.InstitutionID
    @gen_object.ProjectID = orig.ProjectID
    @objects_in_project = GenObject.where("\"ProjectID\" = '#{@gen_object.ProjectID}'")
    
    @images = Image.joins(:projects).where('"tblProject"."ProjectID" = ?', @gen_object.ProjectID).limit(100).order('"DateAdded" desc')
    
    @gen_object.ObjectID = ' - '
    # @ceramic.save
    @in_context = []
    if orig.context_sample != nil
      @in_context = GenObject.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{orig.context_sample.ContextSampleID}'").order('"ObjectID"')
    end
    render action: 'edit'
  end
  
  def images
    # @images = Image.includes(:image_type).joins(:projects).where("(\"ImageFileLocation\" ilike ? or \"ImageDescription\" ilike ? or \"Institution\" ilike ? or \"CatalogueNumber\" ilike ? or \"tblImageType\".\"ImageType\" ilike ?) and (\"tblProject\".\"ProjectID\" = ?)","%#{params[:query]}%", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%", params[:project_id]).references(:image_type).limit(100).order('"tblImage"."DateAdded" desc')
    if params[:query] != nil and params[:query] != ''
      @images = Image.joins(:projects).where("(\"ImageID\"::text = ? or \"CatalogueNumber\" ilike ?) and (\"tblProject\".\"ProjectID\" = ?)","#{params[:query]}", "%#{params[:query]}%", params[:project_id]).limit(100).order('"tblImage"."DateAdded" desc')
    else
      @images = Image.joins(:projects).where("(\"tblProject\".\"ProjectID\" = ?)", params[:project_id]).limit(100).order('"tblImage"."DateAdded" desc')
    end
    @project_id = params[:project_id]
    @image_type = params[:image_type]
    @image_subtype = params[:image_subtype]
    respond_to do |format|
      format.js {render 'partials/images'}
    end    
  end
  
  private
  
  def gen_object_params
    # debugger
    params.require(:gen_object).permit(:ObjectID, :ProjectID, :ProjectNameID, :ObjectDescription, :ObjectTypeID, :ObjectMaterialID, :ObjectWareTypeID, :ObjectManuTechID, :ObjectVesselCategoryID, :ObjectFormID, :ObjectShapeID, :ObjectCompletenessID, :ObjectBasicColorID, :ManufactureCountryID, :InstitutionalObjectNumber, :InstitutionID, :ObjectLocation, :Notes, :Conserved, :ConservationNotes, :ObjectLength, :ObjectLengthComplete, :ObjectWidth, :ObjectWidthComplete, :ObjectHeight, :ObjectHeightComplete, :ObjectWeight, :ObjectCapacity, :ObjectRimDiameter, :ObjectBaseDiameter, :ObjectHeightRimToBase, :ExhibitLength, :ExhibitWidth, :ExhibitHeight, :ObjectDecTechID, :ObjectDecBasicColorID, :ObjectDecPatternID, :DecorationNotes, :ObjectDate, :ExcavatorPhase, :DAACSPhase, gen_object_locations_attributes: [:id, :_destroy, :LoanedTo, :InstitutionContact, :ExhibitName, :DateLoaned, :DateReturned, :ArtifactHandler, :Notes], gen_object_images_attributes: [:id, :_destroy, :ImageID, :ObjectID])
  end
end
