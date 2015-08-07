class CeramicsController < ApplicationController
  before_filter :authenticate_user!

  # GET /ceramics
  # GET /ceramics.json
  def index
    # @ceramics = Ceramic.page params[:page]
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    params[:query] = '' if params[:query] == 'Search'
    # if current_user.user_level >= 3
    @projects = current_user.projects.map{|p| p.ProjectID}
    # debugger
    @total = 0
    if params[:artifacts] != 'my_artifacts'
      @total = Ceramic.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count
      @total_pages = Ceramic.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count / @per_page.to_i + 1
      @ceramics = Ceramic.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").order('"ArtifactID"').page(params[:page]).per(@per_page)
    else
      @total = Ceramic.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count
      @total_pages = Ceramic.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count / @per_page.to_i + 1
      @ceramics = Ceramic.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).order('"ArtifactID"').page(params[:page]).per(@per_page)
    end
    # else
    #   institutions = ProjectInstitution.where('institution_id = ?', current_user.organization_id)
    #   institutions_str = institutions.map { |t| "institution_id = '#{t.id}'" }.join(" OR ")
    #   projects = Project.where(institutions_str).all
    #   projects_str = projects.map{|o| "'#{o.project_id}'"}.join(',')
    #   @total_pages = Ceramic.joins(:project).where("tbl_project.project_id in (#{projects_str})").count / @per_page
    #   @ceramics = Ceramic.joins(:project).includes(:generate_context_artifact).where("tbl_project.project_id in (#{projects_str})").order(:artifact_id).page(params[:page]).per(@per_page)
    #   # debugger
    # end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ceramics }
    end
  end
  
  def artifact_ids
    @ceramics = Ceramic.select('"ArtifactID"','"GenerateContextArtifactID"').where(['"ArtifactID" ilike ?',"%#{params[:q]}%"]).limit(10).order('"ArtifactID"')
    respond_to do |format|
      format.json { render json: @ceramics }
    end    
  end
  
  # GET /ceramics/1
  # GET /ceramics/1.json
  def show
    @ceramic = Ceramic.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ceramic }
    end
  end
  
  # GET /ceramics/new
  # GET /ceramics/new.json
  def new
    @ceramic = Ceramic.new
    # @ceramic.EditorIDN = current_user.editor_id
    @in_context = []
    if params[:context_sample] != nil
      gca = GenerateContextArtifact.create(:ContextSampleID => params[:context_sample], :ArtifactID => '0')
      @in_context = Ceramic.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = ?", params[:context_sample]).order('"ArtifactID"')
      @ceramic.generate_context_artifact = gca
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Ceramic').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @ceramic.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @ceramic.context_sample.project.ProjectID
      @image_subtype = 'Ceramic'
    end
    respond_to do |format|
      format.html { render 'edit'}
      format.json { render json: @ceramic }
    end
  end
  
  # GET /ceramics/1/edit
  def edit
    @ceramic = Ceramic.find(params[:id])
    # if @ceramic.project != nil
    #   @institution_id = @ceramic.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @ceramic.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @in_context = []
    if @ceramic.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Ceramic').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @ceramic.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @ceramic.context_sample.project.ProjectID
      @image_subtype = 'Ceramic'
      @in_context = Ceramic.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@ceramic.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
    # debugger
  end
  
  # POST /ceramics
  # POST /ceramics.json
  def create
    @ceramic = Ceramic.new(ceramic_params)
    # if @ceramic.project != nil
    #   @institution_id = @ceramic.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @ceramic.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @ceramic.EditorIDN = current_user.editor_id
    @in_context = []
    if @ceramic.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Ceramic').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @ceramic.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @ceramic.context_sample.project.ProjectID
      @image_subtype = 'Ceramic'
      @in_context = Ceramic.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@ceramic.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @ceramic.save
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @ceramic.id, :activity => "Created #{@ceramic.ArtifactID}")
        format.html { redirect_to edit_ceramic_path(@ceramic, anchor: anchor), notice: 'Ceramic was successfully created.' }
        format.json { render json: @ceramic, status: :created, location: @ceramic }
      else
        puts " ==========================#{@ceramic.errors}"
        # debugger
        format.html { render action: "edit", notice: 'problems' }
        format.json { render json: @ceramic.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /ceramics/1
  # PUT /ceramics/1.json
  def update
    @ceramic = Ceramic.find(params[:id])
    # if @ceramic.project != nil
    #   @institution_id = @ceramic.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @ceramic.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @ceramic.EditorID = current_user.editor_id
    @in_context = []
    if @ceramic.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Ceramic').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @ceramic.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @ceramic.context_sample.project.ProjectID
      @image_subtype = 'Ceramic'
      @in_context = Ceramic.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@ceramic.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @ceramic.update(ceramic_params)
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @ceramic.id, :activity => "Updated #{@ceramic.ArtifactID}")
        format.html { redirect_to edit_ceramic_path(@ceramic, anchor: anchor), notice: 'Ceramic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ceramic.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /ceramics/1
  # DELETE /ceramics/1.json
  def destroy
    @ceramic = Ceramic.find(params[:id])
    activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @ceramic.id, :activity => "Deleted #{@ceramic.ArtifactID}")
    @ceramic.destroy
  
    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to ceramics_url }
      format.json { head :no_content }
    end
  end
  
  def duplicate
    orig = Ceramic.find(params[:id])
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
    @ceramic = Ceramic.new
    @ceramic.generate_context_artifact = gca
    @ceramic.GenerateContextArtifactID = @ceramic.generate_context_artifact.id
    @ceramic.EditorIDN = current_user.editor_id
    
    @ceramic.ArtifactID = ' - '
    @ceramic.Quantity = orig.Quantity
    @ceramic.WareID = orig.WareID
    @ceramic.CeramicMaterialID = orig.CeramicMaterialID
    @ceramic.CeramicManuTechID = orig.CeramicManuTechID
    @ceramic.CeramicVesselCategoryID = orig.CeramicVesselCategoryID
    @ceramic.CeramicFormID = orig.CeramicFormID
    @ceramic.CeramicCompletenessID = orig.CeramicCompletenessID
    @ceramic.DecorationYN = orig.DecorationYN
    @ceramic.Mended = orig.Mended
    @ceramic.ExteriorGlazeID = orig.ExteriorGlazeID
    @ceramic.ExteriorMunAppColorID = orig.ExteriorMunAppColorID
    @ceramic.ExteriorGlazeOpacityID = orig.ExteriorGlazeOpacityID
    @ceramic.InteriorGlazeID = orig.InteriorGlazeID
    @ceramic.InteriorMunAppColorID = orig.InteriorMunAppColorID
    @ceramic.InteriorGlazeOpacityID = orig.InteriorGlazeOpacityID
    @ceramic.Notes = orig.Notes
    # @ceramic.CeramicGenreID = orig.CeramicGenreID
    # @ceramic.PatternNameID = orig.PatternNameID
    # @ceramic.PatternNotes = orig.PatternNotes
    @ceramic.EvidenceofBurningID = orig.EvidenceofBurningID
    @ceramic.PMM = orig.PMM
    @ceramic.PasteSedimentColorID = orig.PasteSedimentColorID
    @ceramic.OxidizedVersusReducedID = orig.OxidizedVersusReducedID
    @ceramic.CeramicCEWDecModeID = orig.CeramicCEWDecModeID
    @ceramic.CeramicCEWTypeID = orig.CeramicCEWTypeID
    @ceramic.RimFormID = orig.RimFormID
    @ceramic.RimAngleID = orig.RimAngleID
    @ceramic.MaxRimWidth = orig.MaxRimWidth
    @ceramic.CeramicCEWFootringFormID = orig.CeramicCEWFootringFormID
    @ceramic.MendedFormID = orig.MendedFormID
  
    # @ceramic.save
    # if @ceramic.project != nil
    #   @institution_id = @ceramic.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @ceramic.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @in_context = []
    if orig.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Ceramic').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @ceramic.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @ceramic.context_sample.project.ProjectID
      @image_subtype = 'Ceramic'
      @in_context = Ceramic.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{orig.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
    render action: 'edit'
  end
  
  private
  
  def ceramic_params
    # debugger
    params.require(:ceramic).permit( :EditorIDN, :EditorID, :GenerateContextArtifactID, :Quantity, :WareID, :CeramicMaterialID, :CeramicManuTechID, :CeramicVesselCategoryID, :CeramicFormID, :CeramicCompletenessID, :DecorationYN, :Mended, :MendedYNID, :ExteriorGlazeID, :ExteriorMunAppColorID, :ExteriorGlazeOpacityID, :InteriorGlazeID, :InteriorMunAppColorID, :InteriorGlazeOpacityID, :Notes, :SherdThickness, :MaximumSherdMeasurement, :SherdWeight, :MendedSherdWeight, :RimLength, :RimDiameter, :MendedRimDiameter, :BaseLength, :MendedBaseDiameter, :BaseDiameter, :CeramicGenreID, :PatternNameID, :PatternNotes, :EvidenceofBurningID, :PMM, :BaseMarkID, :BaseMarkBasicColorID, :BaseMarkReference, :PasteSedimentColorID, :OxidizedVersusReducedID, :CeramicCEWTypeID, :CeramicCEWDecModeID, :CeramicCEWBaseFormID, :CeramicCEWFootringFormID, :RimFormID, :RimAngleID, :MaxRimWidth, :PasteInclusionDensityID, :MendedFormID, ceramic_dec_techs_attributes: [ :id, :_destroy, :InteriorExteriorID, :CeramicDecTechLocationID, :CeramicDecTechTypeID, :MunAppColorID, :CeramicDecTechStyElemID, :CeramicDecTechMotifID], ceramic_use_wears_attributes: [:id, :UseWearLocationID, :CeramicCompletenessID, :UseWearPatternID, :_destroy], ceramic_paste_inclusions_attributes: [:id, :PasteInclusionID, :_destroy], ceramic_mends_attributes: [:id, :CeramicMendID, :MendsToArtifactID, :GenerateContextArtifactID, :MendsGenerateContextArtifactID, :_destroy], ceramic_colono_thicknesses_attributes: [:id, :CeramicCompletenessID, :ColonoSherdThickness, :_destroy], :gen_object_artifacts_attributes => [:id, :_destroy, :ObjectID, :ArtifactID], artifact_images_attributes: [:id, :_destroy, :ImageID, :ArtifactID])
  end
end
