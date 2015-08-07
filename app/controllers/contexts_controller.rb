class ContextsController < ApplicationController
  # GET /contexts
  # GET /contexts.json
  def index
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    params[:query] = '' if params[:query] == 'Search'
    # @contexts = Context.page params[:page]
    @total = 0
    if params[:artifacts] != 'my_artifacts'
      if current_user.is_admin?
        @contexts = Context.includes(:project_name).where("\"ContextID\" ilike ? or \"FeatureNumber\" ilike ? or \"QuadratID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ?","#{params[:query]}", "#{params[:query]}","#{params[:query]}","#{params[:query]}").references(:project_name).order('"ContextID"').page(@page).per(@per_page)
        # debugger
        @total = Context.includes(:project_name).where("\"ContextID\" ilike ? or \"FeatureNumber\" ilike ? or \"QuadratID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ?","#{params[:query]}","#{params[:query]}","#{params[:query]}","#{params[:query]}").references(:project_name).count
        @total_pages = Context.includes(:project_name).where("\"ContextID\" ilike ? or \"FeatureNumber\" ilike ? or \"QuadratID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ?","#{params[:query]}","#{params[:query]}","#{params[:query]}","#{params[:query]}").references(:project_name).count / @per_page.to_i + 1
      else
        institutions = ProjectInstitution.where('"InstitutionID" = ?', current_user.organization_id)
        institutions_str = institutions.map { |t| "\"InstitutionID\" = '#{t.id}'" }.join(" OR ")
        projects = current_user.projects #Project.where(institutions_str).all
        projects_str = projects.map { |t| "\"tblContext\".\"ProjectID\" = '#{t.id}'" }.join(" OR ")
        @contexts = Context.includes(:project_name).where("(#{projects_str}) and (\"ContextID\" ilike ? or \"FeatureNumber\" ilike ? or \"QuadratID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ?)","#{params[:query]}","#{params[:query]}","#{params[:query]}","#{params[:query]}").references(:project_name).order('"ContextID"').page(@page).per(@per_page)
        @total = Context.includes(:project_name).where("(#{projects_str}) and (\"ContextID\" ilike ? or \"FeatureNumber\" ilike ? or \"QuadratID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ?)","#{params[:query]}","#{params[:query]}","#{params[:query]}","#{params[:query]}").references(:project_name).count
        @total_pages = Context.includes(:project_name).where("(#{projects_str}) and (\"ContextID\" ilike ? or \"FeatureNumber\" ilike ? or \"QuadratID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ?)","#{params[:query]}","#{params[:query]}","#{params[:query]}","#{params[:query]}").references(:project_name).count / @per_page.to_i + 1
      end
    else
      if current_user.is_admin?
        @contexts = Context.includes(:project_name).where("(\"ContextID\" ilike ? or \"FeatureNumber\" ilike ? or \"QuadratID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ?) and \"tblContext\".\"EditorIDN\" = ?","#{params[:query]}", "#{params[:query]}","#{params[:query]}","#{params[:query]}",current_user.editor_id).references(:project_name).order('"ContextID"').page(@page).per(@per_page)
        # debugger
        @total = Context.includes(:project_name).where("(\"ContextID\" ilike ? or \"FeatureNumber\" ilike ? or \"QuadratID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ?) and \"tblContext\".\"EditorIDN\" = ?","#{params[:query]}","#{params[:query]}","#{params[:query]}","#{params[:query]}", current_user.editor_id).references(:project_name).count
        @total_pages = Context.includes(:project_name).where("(\"ContextID\" ilike ? or \"FeatureNumber\" ilike ? or \"QuadratID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ?) and \"tblContext\".\"EditorIDN\" = ?","#{params[:query]}","#{params[:query]}","#{params[:query]}","#{params[:query]}",current_user.editor_id).references(:project_name).count / @per_page.to_i + 1
      else
        institutions = ProjectInstitution.where('"InstitutionID" = ?', current_user.organization_id)
        institutions_str = institutions.map { |t| "\"InstitutionID\" = '#{t.id}'" }.join(" OR ")
        projects = current_user.projects #Project.where(institutions_str).all
        projects_str = projects.map { |t| "\"tblContext\".\"ProjectID\" = '#{t.id}'" }.join(" OR ")
        @contexts = Context.includes(:project_name).where("(#{projects_str}) and (\"ContextID\" ilike ? or \"FeatureNumber\" ilike ? or \"QuadratID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ?) and \"tblContext\".\"EditorIDN\" = ?","#{params[:query]}","#{params[:query]}","#{params[:query]}","#{params[:query]}",current_user.editor_id).references(:project_name).order('"ContextID"').page(@page).per(@per_page)
        @total = Context.includes(:project_name).where("(#{projects_str}) and (\"ContextID\" ilike ? or \"FeatureNumber\" ilike ? or \"QuadratID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ?) and \"tblContext\".\"EditorIDN\" = ?","#{params[:query]}","#{params[:query]}","#{params[:query]}","#{params[:query]}", current_user.editor_id).references(:project_name).count
        @total_pages = Context.includes(:project_name).where("(#{projects_str}) and (\"ContextID\" ilike ? or \"FeatureNumber\" ilike ? or \"QuadratID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ?) and \"tblContext\".\"EditorIDN\" = ?","#{params[:query]}","#{params[:query]}","#{params[:query]}","#{params[:query]}", current_user.editor_id).references(:project_name).count / @per_page.to_i + 1
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contexts }
    end
  end

  # GET /contexts/1
  # GET /contexts/1.json
  def show
    @context = Context.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context }
    end
  end

  # GET /contexts/new
  # GET /contexts/new.json
  def new
    @context = Context.new
    @contexts_in_project = Context.where(:ProjectID => @context.ProjectID).order(:Context).map{|c| c.Context}
    @context_features = ContextFeature.where(:ProjectID => @context.ProjectID).order('"FeatureNumber"').limit(100)
    @project_id = @context.project != nil ? @context.project.ProjectID : ''

    respond_to do |format|
      format.html { render 'edit'}
      format.json { render json: @context }
    end
  end

  # GET /contexts/1/edit
  def edit
    @context = Context.find(params[:id])
    @contexts_in_project = Context.where(:ProjectID => @context.ProjectID).order(:Context).map{|c| c.Context}
    # @context.EditorID = current_user.editor_id
    if @context.project != nil
      @institution_id = @context.project.InstitutionID
      @images = Image.where(:InstitutionID => @context.project.InstitutionID).limit(100).order('"DateAdded" desc')
    else
      @images = Image.limit(100).order('"DateAdded" desc')
    end
    # @feature = @context.context_features.where(:feature_number => @context.feature_number).first
    @context_features = ContextFeature.where(:ProjectID => @context.ProjectID).order('"FeatureNumber"').limit(100)
    @project_id = @context.project != nil ? @context.project.ProjectID : ''
  end

  # POST /contexts
  # POST /contexts.json
  def create
    @context = Context.new(context_params)
    @contexts_in_project = Context.where(:ProjectID => @context.ProjectID).order(:Context).map{|c| c.Context}
    @context.EditorIDN = current_user.editor_id
    @context.DateAdded = Time.now
    @context_features = ContextFeature.where(:ProjectID => @context.ProjectID).order('"FeatureNumber"').limit(100)
    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @context.save
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @context.id, :activity => "Created Context #{@context.ContextID}")
        format.html { redirect_to edit_context_path(@context, anchor: anchor), notice: 'Context was successfully created.' }
        format.json { render json: @context, status: :created, location: @context }
      else
        format.html { render action: "edit" }
        format.json { render json: @context.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contexts/1
  # PUT /contexts/1.json
  def update
    @context = Context.find(params[:id])
    @contexts_in_project = Context.where(:ProjectID => @context.ProjectID).order(:Context).map{|c| c.Context}
    @context_features = ContextFeature.where(:ProjectID => @context.ProjectID).order('"FeatureNumber"').limit(100)
    @context.EditorID = current_user.editor_id

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
    
      if @context.update(context_params)
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @context.id, :activity => "Updated Context #{@context.ContextID}")
        format.html { redirect_to edit_context_path(@context, anchor: anchor), notice: 'Context was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: 'uh oh' }
        format.json { render json: @context.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contexts/1
  # DELETE /contexts/1.json
  def destroy
    @context = Context.find(params[:id])
    activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @context.id, :activity => "Deleted Context #{@context.ContextID}")
    @context.destroy

    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to contexts_url }
      format.json { head :no_content }
    end
  end
  
  def context_ids
    samples = ContextSample.includes(:project).where('"tblProject"."ProjectID" = ?',params[:project_id]).order('"ContextSampleID"')
    
    # contexts = Context.where(['"ProjectID" ilike ?', params[:project_id]])
    ids = []
    # contexts.each do |context|
    samples.each {|cs|
        ids << {:id => cs.id}
      }
    # end
    render :json => ids
  end
  
  def duplicate
    orig = Context.find(params[:id])
    @context = Context.new
    @context.ProjectID = orig.ProjectID
    @contexts_in_project = Context.where(:ProjectID => @context.ProjectID).order(:Context).map{|c| c.Context}
    @context.Excavated = orig.Excavated
    @context.LevelTypeID = orig.LevelTypeID
    @context.DepositTypeID = orig.DepositTypeID
    @context.LevelTypeID = orig.LevelTypeID
    @context.UnitTypeID = orig.UnitTypeID
    # @context.SpatialDistribution = orig.SpatialDistribution
    @context.ArtifactPresence = orig.ArtifactPresence
    @context.QuadratID = orig.QuadratID
    @context.ExcavatorSedimentDescription = orig.ExcavatorSedimentDescription
    
    @context.EditorIDN = current_user.editor_id
    @context_features = ContextFeature.where(:ProjectID => @context.ProjectID).order('"FeatureNumber"').limit(100)
    
    render action: 'edit'
  end
  
  def features
    params[:query] = '' if params[:query] == 'Search'
    @project_id = params[:project_id]
    @context_features = ContextFeature.where("\"FeatureNumber\" ilike ? and \"ProjectID\" = ?","%#{params[:query]}%", "#{params[:project_id]}").order('"FeatureNumber"').order('"FeatureNumber"').limit(100)
    # render :js => 'features'
    respond_to do |format|
      format.js
    end
    
  end
  
  def create_new_artifact
    if params['data-type'] == 'ceramics'
      redirect_to :controller => 'ceramics', :action => 'new', :context_sample => params['context_sample']
    elsif params['data-type'] == 'gen_artifacts'
      redirect_to :controller => 'gen_artifacts', :action => 'new', :context_sample => params['context_sample']
    elsif params['data-type'] == 'glass'
      redirect_to :controller => 'glasses', :action => 'new', :context_sample => params['context_sample']
    elsif params['data-type'] == 'pipe'
      redirect_to :controller => 'tobacco_pipes', :action => 'new', :context_sample => params['context_sample']
    elsif params['data-type'] == 'bone'
      redirect_to :controller => 'bones', :action => 'new', :context_sample => params['context_sample']
    elsif params['data-type'] == 'bead'
      redirect_to :controller => 'beads', :action => 'new', :context_sample => params['context_sample']
    elsif params['data-type'] == 'buckle'
      redirect_to :controller => 'buckles', :action => 'new', :context_sample => params['context_sample']
    elsif params['data-type'] == 'utensil'
      redirect_to :controller => 'utensils', :action => 'new', :context_sample => params['context_sample']
    elsif params['data-type'] == 'button'
      redirect_to :controller => 'buttons', :action => 'new', :context_sample => params['context_sample']
    else
      render :text => 'not available yet'
    end
  end
  
  private
  
  def context_params
    # debugger
    params.require(:context).permit(:ProjectID, :Context, :FeatureNumber, :Excavated, :LevelTypeID, :DepositTypeID, :SpatialDistribution, :UnitTypeID, :ContextLength, :ContextWidth, :MaximumLithostratigraphicThickness, :ActualMeasuredVolume, :QuadratLength, :QuadratWidth, :ArtifactPresence, :TPQ, :TPQNotes, :ExcavatorDescription, :ExcavatorInterpretation, :DataEntryNotes, :STPEasting, :STPNorthing, :LevelDesignation, :MasterContextNumber, :MasterContextInterpretation, :ExcavatorPhase, :DAACSStratigraphicGroup, :DAACSStratigraphicGroupInterpretation, :DAACSPhase, :CAPlowzonePhase, :Photographs, :PlanDrawings, :ProfileDrawings, :QuadratID, :DateOpened, :DateClosed, :RecordedBy, :ExcavatedBy, :ExcavatorSedimentDescription, :FSNumber, context_samples_attributes: [:id, :ContextSampleID,  :ContextSampleTypeID, :RecoveryMethodID, :SampleNumber, :SampleSize, :SampleTypeID, :ScreenSizeID, :_destroy, :StorageBoxNumber, :BoxComments, context_sample_locations_attributes: [:id, :_destroy, :ContextSampleLocationInstitutionID, :ContextSampleStatusID, :DateLoaned, :DateReturned, :SampleNotes, :BoxNumber]], context_fine_sediments_attributes: [:id, :FineSedimentTextureID, :MunSedColorID, :ExcavatorSedimentColorDescription, :RankOrder, :PercentageID, :_destroy], context_inclusions_attributes: [:id, :InclusionDescriptionID, :InclusionSizeID, :RankOrder, :PercentageID, :_destroy], context_strat_rels_attributes: [:id, :StratRelTypeID, :Context, :_destroy], context_elevations_attributes: [:id, :_destroy, :OpeningClosingID, :ContextElevationLocID, :ElevationAmount], context_quadrat_boundaries_attributes: [:id, :_destroy, :QuadratEasting, :QuadratNorthing], context_stp_levels_attributes: [:id, :_destroy, :STPLevel, :STPClosing, context_stp_sediments_attributes: [:id, :_destroy, :FineSedimentTextureID, :MunSedColorID, :PercentageID], context_stp_inclusions_attributes: [:id, :_destroy, :InclusionDescriptionID, :InclusionSizeID, :PercentageID]], context_images_attributes: [:id, :_destroy, :ImageID, :ContextID])
  end
  
end
