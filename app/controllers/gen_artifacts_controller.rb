class GenArtifactsController < ApplicationController
  # GET /gen_artifacts
  # GET /gen_artifacts.json
  def index
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    params[:query] = '' if params[:query] == 'Search'
    # if current_user.user_level >= 3
    @projects = current_user.projects.map{|p| p.ProjectID}
    # debugger
    @total = 0
    if params[:artifacts] != 'my_artifacts'
      @total = GenArtifact.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count
      @total_pages = GenArtifact.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count / @per_page.to_i + 1
      @gen_artifacts = GenArtifact.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").order('"ArtifactID"').page(params[:page]).per(@per_page)
    else
      @total = GenArtifact.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count
      @total_pages = GenArtifact.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count / @per_page.to_i + 1
      @gen_artifacts = GenArtifact.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).order('"ArtifactID"').page(params[:page]).per(@per_page)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gen_artifacts }
    end
  end

  # GET /gen_artifacts/1
  # GET /gen_artifacts/1.json
  def show
    @gen_artifact = GenArtifact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gen_artifact }
    end
  end

  # GET /gen_artifacts/new
  # GET /gen_artifacts/new.json
  def new
    @gen_artifact = GenArtifact.new
    @in_context = []
    if params[:context_sample] != nil
      gca = GenerateContextArtifact.create(:ContextSampleID => params[:context_sample], :ArtifactID => '0')
      @in_context = GenArtifact.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = ?", params[:context_sample]).order('"ArtifactID"')
      @gen_artifact.generate_context_artifact = gca
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'All Other Artifacts').map  {|i| i.ImageSubtypeID }
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @gen_artifact.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @gen_artifact.context_sample.project.ProjectID
      @image_subtype = 'All Other Artifacts'
    end
    respond_to do |format|
      format.html { render 'edit'}
      format.json { render json: @gen_artifact }
    end
  end

  # GET /gen_artifacts/1/edit
  def edit
    @gen_artifact = GenArtifact.find(params[:id])
    # if @gen_artifact.project != nil
    #   @institution_id = @gen_artifact.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @gen_artifact.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @in_context = []
    if @gen_artifact.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'All Other Artifacts').map  {|i| i.ImageSubtypeID }
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @gen_artifact.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @gen_artifact.context_sample.project.ProjectID
      @image_subtype = 'All Other Artifacts'
      @in_context = GenArtifact.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@gen_artifact.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
  end

  # POST /gen_artifacts
  # POST /gen_artifacts.json
  def create
    @gen_artifact = GenArtifact.new(gen_artifact_params)
    # if @gen_artifact.project != nil
    #   @institution_id = @button.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @button.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @gen_artifact.EditorIDN = current_user.editor_id
    @in_context = []
    if @gen_artifact.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'All Other Artifacts').map  {|i| i.ImageSubtypeID }
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @gen_artifact.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @gen_artifact.context_sample.project.ProjectID
      @image_subtype = 'All Other Artifacts'
      @in_context = GenArtifact.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@gen_artifact.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @gen_artifact.save
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @gen_artifact.id, :activity => "Created #{@gen_artifact.ArtifactID}")
        format.html { redirect_to edit_gen_artifact_path(@gen_artifact, anchor: anchor), notice: 'Gen artifact was successfully created.' }
        format.json { render json: @gen_artifact, status: :created, location: @gen_artifact }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_artifact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gen_artifacts/1
  # PUT /gen_artifacts/1.json
  def update
    @gen_artifact = GenArtifact.find(params[:id])
    # if @gen_artifact.project != nil
    #   @institution_id = @gen_artifact.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @gen_artifact.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @gen_artifact.EditorID = current_user.editor_id
    @in_context = []
    if @gen_artifact.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'All Other Artifacts').map  {|i| i.ImageSubtypeID }
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @gen_artifact.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @gen_artifact.context_sample.project.ProjectID
      @image_subtype = 'All Other Artifacts'
      @in_context = GenArtifact.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@gen_artifact.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @gen_artifact.update(gen_artifact_params)
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @gen_artifact.id, :activity => "Updated #{@gen_artifact.ArtifactID}")
        format.html { redirect_to edit_gen_artifact_path(@gen_artifact, anchor: anchor), notice: 'Gen artifact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gen_artifact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gen_artifacts/1
  # DELETE /gen_artifacts/1.json
  def destroy
    @gen_artifact = GenArtifact.find(params[:id])
    activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @gen_artifact.id, :activity => "Deleted #{@gen_artifact.ArtifactID}")
    @gen_artifact.destroy

    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to gen_artifacts_url }
      format.json { head :no_content }
    end
  end
  
  def duplicate
    orig = GenArtifact.find(params[:id])
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
    @gen_artifact = GenArtifact.new
    @gen_artifact.generate_context_artifact = gca
    # @gen_artifact.generate_context_artifact.save
    @gen_artifact.GenerateContextArtifactID = @gen_artifact.generate_context_artifact.id
    @gen_artifact.EditorIDN = current_user.editor_id
    @gen_artifact.Quantity = orig.Quantity
    @gen_artifact.GenArtifactCategoryID = orig.GenArtifactCategoryID
    @gen_artifact.GenArtifactCompletenessID = orig.GenArtifactCompletenessID
    @gen_artifact.Mended = orig.Mended
    @gen_artifact.CoinDate = orig.CoinDate
    @gen_artifact.BrickSizeID = orig.BrickSizeID
    @gen_artifact.NailHeadTypeID = orig.NailHeadTypeID
    @gen_artifact.NailEndTypeID = orig.NailEndTypeID
    @gen_artifact.NailModificationID = orig.NailModificationID
    @gen_artifact.Marks = orig.Marks
    @gen_artifact.DescriptionofMarks = orig.DescriptionofMarks
    @gen_artifact.Burned = orig.Burned
    @gen_artifact.Conservation = orig.Conservation
    @gen_artifact.PMM = orig.PMM
    @gen_artifact.GenArtifactFormID = orig.GenArtifactFormID
    @gen_artifact.Notes = orig.Notes
    
    
    @gen_artifact.ArtifactID = ' - '
    # @ceramic.save
    # if @gen_artifact.project != nil
    #   @institution_id = @gen_artifact.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @gen_artifact.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @in_context = []
    if orig.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'All Other Artifacts').map  {|i| i.ImageSubtypeID }
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @gen_artifact.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @gen_artifact.context_sample.project.ProjectID
      @image_subtype = 'All Other Artifacts'
      @in_context = GenArtifact.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{orig.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
    render action: 'edit'
  end
  
  
  private
  
  def gen_artifact_params
    # debugger
    params.require(:gen_artifact).permit(:GenerateContextArtifactID, :Quantity, :GenArtifactCategoryID, :GenArtifactFormID, :Mended, :MendedYNID, :DecorationYN, :CoinDate, :Notes, :Length, :Width, :Height, :Weight, :BrickSizeID, :NailHeadTypeID, :NailEndTypeID, :NailModificationID, :NailLength, :Marks, :DescriptionofMarks, :Burned, :PMM, :Conservation, :Diameter, :GenArtifactCompletenessID, gen_artifact_dec_techs_attributes: [:id, :_destroy, :GenArtifactDecTechTypeID, :GenArtDecTechBasicColorID, :DecorationNotes], gen_artifact_materials_attributes: [:id,:_destroy, :GenArtifactMaterialTypeID,:GenArtifactManuTechID], :gen_object_artifacts_attributes => [:id, :_destroy, :ObjectID, :ArtifactID], artifact_images_attributes: [:id, :_destroy, :ImageID, :ArtifactID], :gen_object_artifacts_attributes => [:id, :_destroy, :ObjectID, :ArtifactID], artifact_images_attributes: [:id, :_destroy, :ImageID, :ArtifactID])
  end
  
end
