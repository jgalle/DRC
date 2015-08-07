class ButtonsController < ApplicationController
  # GET /buttons
  # GET /buttons.json
  def index
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    params[:query] = '' if params[:query] == 'Search'
    # if current_user.user_level >= 3
    @projects = current_user.projects.map{|p| p.ProjectID}
    # debugger
    @total = 0
    if params[:artifacts] != 'my_artifacts'
      @total = Button.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count
      @total_pages = Button.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count / @per_page.to_i + 1
      @buttons = Button.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").order('"ArtifactID"').page(params[:page]).per(@per_page)
    else
      @total = Button.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count
      @total_pages = Button.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count / @per_page.to_i + 1
      @buttons = Button.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).order('"ArtifactID"').page(params[:page]).per(@per_page)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buttons }
    end
  end

  # GET /glasses/1
  # GET /glasses/1.json
  def show
    @button = Button.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @button }
    end
  end

  # GET /glasses/new
  # GET /glasses/new.json
  def new
    @button = Button.new
    # @button.EditorIDN = current_user.editor_id
    @in_context = []
    if params[:context_sample] != nil
      gca = GenerateContextArtifact.create(:ContextSampleID => params[:context_sample], :ArtifactID => '0')
      @in_context = Button.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = ?", params[:context_sample]).order('"ArtifactID"')
      @button.generate_context_artifact = gca
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Button').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @button.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @button.context_sample.project.ProjectID
      @image_subtype = 'Button'
    end

    respond_to do |format|
      format.html { render 'edit'}
      format.json { render json: @button }
    end
  end

  # GET /glasses/1/edit
  def edit
    @button = Button.find(params[:id])
    # if @button.project != nil
    #   @institution_id = @button.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @button.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @in_context = []
    if @button.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Button').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @button.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @button.context_sample.project.ProjectID
      @image_subtype = 'Button'
      @in_context = Button.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@button.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
  end

  # POST /glasses
  # POST /glasses.json
  def create
    @button = Button.new(buttons_params)
    # if @button.project != nil
    #   @institution_id = @button.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @button.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @button.EditorIDN = current_user.editor_id
    @in_context = []
    if @button.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Button').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @button.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @button.context_sample.project.ProjectID
      @image_subtype = 'Button'
      @in_context = Button.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@button.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end

    anchor = params[:active_tag] != nil and params[:active_tag] != '' ? params[:active_tag].gsub('#','') : ''
    
    respond_to do |format|
      if @button.save
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @button.id, :activity => "Created #{@button.ArtifactID}")
        format.html { redirect_to edit_button_path(@button, anchor: anchor), notice: 'Button was successfully created.' }
        format.json { render json: @button, status: :created, location: @button }
      else
        format.html { render action: "edit" }
        format.json { render json: @button.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glasses/1
  # PUT /glasses/1.json
  def update
    @button = Button.find(params[:id])
    # if @button.project != nil
    #   @institution_id = @button.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @button.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @button.EditorID = current_user.editor_id
    @in_context = []
    if @button.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Button').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @button.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @button.context_sample.project.ProjectID
      @image_subtype = 'Button'
      @in_context = GenArtifact.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@button.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    puts "================#{anchor}"
    respond_to do |format|
      if @button.update_attributes(buttons_params)
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @button.id, :activity => "Updated #{@button.ArtifactID}")
        format.html { redirect_to edit_button_path(@button, anchor: anchor), notice: 'Button was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @button.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glasses/1
  # DELETE /glasses/1.json
  def destroy
    @button = Button.find(params[:id])
    activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @button.id, :activity => "Deleted #{@button.ArtifactID}")
    @button.destroy

    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to buttons_url }
      format.json { head :no_content }
    end
  end
  
  def duplicate
    orig = Button.find(params[:id])
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
    @button = Button.new
    @button.EditorIDN = current_user.editor_id
    @button.generate_context_artifact = gca
    # @button.generate_context_artifact.save
    @button.GenerateContextArtifactID = @button.generate_context_artifact.id
    @button.EditorIDN = current_user.editor_id
    @button.Quantity = orig.Quantity
    @button.CompletenessID = orig.CompletenessID
    @button.ButtonMaterialID = orig.ButtonMaterialID
    @button.ButtonManuTechID = orig.ButtonManuTechID
    @button.ButtonTypeID = orig.ButtonTypeID
    @button.ButtonShapeID = orig.ButtonShapeID
    @button.ButtonBasicColorID = orig.ButtonBasicColorID
    @button.ButtonMetalColorID = orig.ButtonMetalColorID
    @button.DecorationYN = orig.DecorationYN
    @button.EyeID = orig.EyeID
    @button.ShankMaterialID = orig.ShankMaterialID
    @button.ShankStyleID = orig.ShankStyleID
    @button.ShankConditionID = orig.ShankConditionID
    @button.BackStamp = orig.BackStamp
    @button.ButtonFaceMaterialID = orig.ButtonFaceMaterialID
    @button.ButtonFaceManuTechID = orig.ButtonFaceManuTechID
    @button.ButtonJoinMethodID = orig.ButtonJoinMethodID
    @button.Burned = orig.Burned
    @button.PMM = orig.PMM
    @button.Conservation = orig.Conservation
    @button.Notes = orig.Notes
     
    
    @button.ArtifactID = ' - '
    # @ceramic.save
    # if @button.project != nil
    #   @institution_id = @button.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @button.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @in_context = []
    if orig.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Button').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @button.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @button.context_sample.project.ProjectID
      @image_subtype = 'Button'
      @in_context = Button.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{orig.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
    render action: 'edit'
  end
  
  def artifact_ids
    @buttons = Button.select('"ArtifactID"','"GenerateContextArtifactID"').where(['"ArtifactID" ilike ?',"%#{params[:q]}%"]).limit(10).order('"ArtifactID"')
    respond_to do |format|
      format.json { render json: @buttons }
    end    
  end
  
  
  private
  
  def buttons_params
    # debugger
    params.require(:button).permit(:GenerateContextArtifactID, :Quantity, :CompletenessID, :ButtonMaterialID, :ButtonManuTechID, :ButtonTypeID, :ButtonShapeID, :ButtonBasicColorID, :ButtonMetalColorID, :DecorationYN, :MendedYNID, :EyeID, :ShankMaterialID, :ShankStyleID, :ShankConditionID, :Notes, :Weight, :Height, :Diameter, :Length, :Width, :BackStamp, :ButtonFaceMaterialID, :ButtonFaceManuTechID, :ButtonJoinMethodID, :Burned, :PMM, :Conservation, button_dec_techs_attributes: [:id, :_destroy, :ButtonDecorationID, :ButtonDecTechBasicColorID, :JewelInlayMaterialID, :DecorativeMotif], :gen_object_artifacts_attributes => [:id, :_destroy, :ObjectID, :ArtifactID], artifact_images_attributes: [:id, :_destroy, :ImageID, :ArtifactID])
  end
end
