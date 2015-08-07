class UtensilsController < ApplicationController
  # GET /utensils
  # GET /utensils.json
  def index
    @utensils = Utensil.all
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    params[:query] = '' if params[:query] == 'Search'
    # if current_user.user_level >= 3
    @projects = current_user.projects.map{|p| p.ProjectID}
    # debugger
    if params[:artifacts] != 'my_artifacts'
      @total = Utensil.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count
      @total_pages = Utensil.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count / @per_page.to_i + 1
      @utensils = Utensil.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").order('"ArtifactID"').page(params[:page]).per(@per_page)
    else
      @total = Utensil.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count
      @total_pages = Utensil.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count / @per_page.to_i + 1
      @utensils = Utensil.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).order('"ArtifactID"').page(params[:page]).per(@per_page)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @utensils }
    end
  end

  # GET /utensils/1
  # GET /utensils/1.json
  def show
    @utensil = Utensil.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @utensil }
    end
  end

  # GET /utensils/new
  # GET /utensils/new.json
  def new
    @utensil = Utensil.new
    # @utensil.EditorIDN = current_user.editor_id
    @in_context = []
    if params[:context_sample] != nil
      gca = GenerateContextArtifact.create(:ContextSampleID => params[:context_sample], :ArtifactID => '0')
      @in_context = Utensil.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = ?", params[:context_sample]).order('"ArtifactID"')
      @utensil.generate_context_artifact = gca
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Utensils').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @utensil.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @utensil.context_sample.project.ProjectID
      @image_subtype = 'Utensils'
    end

    respond_to do |format|
      format.html { render 'edit'}
      format.json { render json: @utensil }
    end
  end

  # GET /utensils/1/edit
  def edit
    @utensil = Utensil.find(params[:id])
    # if @utensil.project != nil
    #   @institution_id = @utensil.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @utensil.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @in_context = []
    if @utensil.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Utensils').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @utensil.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @utensil.context_sample.project.ProjectID
      @image_subtype = 'Utensils'
       @in_context = Utensil.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@utensil.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
  end

  # POST /utensils
  # POST /utensils.json
  def create
    @utensil = Utensil.new(utensil_params)
    # if @utensil.project != nil
    #   @institution_id = @utensil.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @utensil.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @utensil.EditorIDN = current_user.editor_id
    @in_context = []
    if @utensil.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Utensils').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @utensil.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @utensil.context_sample.project.ProjectID
      @image_subtype = 'Utensils'
      @in_context = Glass.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@utensil.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @utensil.save
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @utensil.id, :activity => "Created #{@utensil.ArtifactID}")
        format.html { redirect_to edit_utensil_path(@utensil, anchor: anchor), notice: 'Utensil was successfully created.' }
        format.json { render json: @utensil, status: :created, location: @utensil }
      else
        format.html { render action: "new" }
        format.json { render json: @utensil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /utensils/1
  # PUT /utensils/1.json
  def update
    @utensil = Utensil.find(params[:id])
    # if @utensil.project != nil
    #   @institution_id = @utensil.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @utensil.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @utensil.EditorID = current_user.editor_id
    @in_context = []
    if @utensil.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Utensils').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @utensil.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @utensil.context_sample.project.ProjectID
      @image_subtype = 'Utensils'
      @in_context = Utensil.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@utensil.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''

    respond_to do |format|
      if @utensil.update_attributes(utensil_params)
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @utensil.id, :activity => "Updated #{@utensil.ArtifactID}")
        format.html { redirect_to edit_utensil_path(@utensil, anchor: anchor), notice: 'Utensil was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @utensil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utensils/1
  # DELETE /utensils/1.json
  def destroy
    @utensil = Utensil.find(params[:id])
    activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @utensil.id, :activity => "Deleted #{@utensil.ArtifactID}")
    @utensil.destroy

    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to utensils_url }
      format.json { head :no_content }
    end
  end
  
  def duplicate
    orig = Utensil.find(params[:id])
    gca = GenerateContextArtifact.new
    gca.ArtifactID = '0'
    gca.context_sample = orig.context_sample
    # gca.save
    # max_artifact_id = GenerateContextArtifact.where('ContextSampleID' => orig.context_sample).maximum('ArtifactID')
    # if max_artifact_id != nil
    #   max_artifact_id = max_artifact_id.split('-').last.to_i + 1
    # else
    #   max_artifact_id = 1
    # end
    # gca.ArtifactID = "#{gca.ContextSampleID.gsub(';','')}-#{max_artifact_id.to_s.rjust(5,'0')}"
    gca.save
    @utensil = Utensil.new
    @utensil.EditorIDN = current_user.editor_id
    @utensil.generate_context_artifact = gca
    # @utensil.generate_context_artifact.save
    @utensil.GenerateContextArtifactID = @utensil.generate_context_artifact.id
    @utensil.EditorIDN = current_user.editor_id
    @utensil.Quantity = orig.Quantity
    @utensil.CompletenessID = orig.CompletenessID
    @utensil.UtensilFormID = orig.UtensilFormID
    @utensil.ForkTineCountID = orig.ForkTineCountID
    @utensil.Mended = orig.Mended
    @utensil.Marks = orig.Marks
    @utensil.DecorationYN = orig.DecorationYN
    @utensil.UtensilPlatingID = orig.UtensilPlatingID
    @utensil.HandleDecorationID = orig.HandleDecorationID
    @utensil.SpoonRatTail = orig.SpoonRatTail
    @utensil.Burned = orig.Burned
    @utensil.PMM = orig.PMM
    @utensil.Conservation = orig.Conservation
    @utensil.Notes = orig.Notes
    
    
    @utensil.ArtifactID = ' - '
    # @ceramic.save
    # if @utensil.project != nil
    #   @institution_id = @utensil.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @utensil.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @in_context = []
    if orig.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Utensils').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @utensil.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @utensil.context_sample.project.ProjectID
      @image_subtype = 'Utensils'
      @in_context = Utensil.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{orig.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
    render action: 'edit'
  end
  
  def artifact_ids
    @glasses = Glass.select('"ArtifactID"','"GenerateContextArtifactID"').where(['"ArtifactID" ilike ?',"%#{params[:q]}%"]).limit(10).order('"ArtifactID"')
    respond_to do |format|
      format.json { render json: @glasses }
    end    
  end
  
  
  private
  
  def utensil_params
    # debugger
    params.require(:utensil).permit(:GenerateContextArtifactID, :Quantity, :CompletenessID, :UtensilFormID, :ForkTineCountID, :Mended, :MendedYNID, :DecorationYN, :Notes, :ArtifactLength, :ArtifactWidth, :ArtifactWeight, :Marks, :UtensilPlatingID, :HandleDecorationID, :SpoonRatTail, :Burned, :PMM, :Conservation, utensil_specifics_attributes: [:id, :_destroy, :UtensilPartID, :UtensilShapeID, :UtensilManuTechID, :UtensilMaterialID, :PartLength, :PartWidth, :PartHeight], :gen_object_artifacts_attributes => [:id, :_destroy, :ObjectID, :ArtifactID], artifact_images_attributes: [:id, :_destroy, :ImageID, :ArtifactID])
  end
end
