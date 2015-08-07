class ContextFeaturesController < ApplicationController
  # GET /context_feature_context_features
  # GET /context_feature_context_features.json
  def index
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    params[:query] = '' if params[:query] == 'Search'
    # @contextcontext_features = ContextFeature.page params[:page]
    @total = 0
    if current_user.user_level >= 3
      @total = ContextFeature.where("\"ProjectID\" ilike ?","%#{params[:query]}%").count()
      @context_features = ContextFeature.where("\"ProjectID\" ilike ?","%#{params[:query]}%").order('"FeatureNumber"').page(@page).per(@per_page)
      # debugger
      @total_pages = ContextFeature.where("\"ProjectID\" ilike ?","%#{params[:query]}%").count / @per_page.to_i + 1
    else
      institutions = ProjectInstitution.where('"InstitutionID" = ?', current_user.organization_id)
      institutions_str = institutions.map { |t| "\"InstitutionID\" = '#{t.id}'" }.join(" OR ")
      # projects = Project.where(institutions_str).all
      projects = current_user.projects #Project.where(institutions_str).all
      projects_str = projects.map { |t| "\"ProjectID\" = '#{t.id}'" }.join(" OR ")
      @context_features = ContextFeature.where("(#{projects_str}) and (\"ProjectID\" ilike ?)","%#{params[:query]}%").order('"FeatureNumber"').page(@page).per(@per_page)
      @total = ContextFeature.where("(#{projects_str}) and (\"ProjectID\" ilike ?)","%#{params[:query]}%").count()
      @total_pages = ContextFeature.where("(#{projects_str}) and (\"ProjectID\" ilike ?)","%#{params[:query]}%").count / @per_page.to_i + 1
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @context_features }
    end
  end

  # GET /context_features/1
  # GET /context_features/1.json
  def show
    @context_feature = ContextFeature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @context_feature }
    end
  end

  # GET /context_features/new
  # GET /context_features/new.json
  def new
    @context_feature = ContextFeature.new
    @in_context = []

    respond_to do |format|
      format.html { render 'edit'}
      format.json { render json: @context_feature }
    end
  end

  # GET /context_features/1/edit
  def edit
    @context_feature = ContextFeature.find(params[:id])
    @context_feature.EditorID = current_user.editor_id
    # @context_feature = @context_feature.context_feature_context_features.where(:context_feature_number => @context_feature.context_feature_number).first
    @in_context = []
    if @context_feature.project != nil
      @in_context = ContextFeature.joins(:project).where("\"tblProject\".\"ProjectID\" = '#{@context_feature.project.ProjectID}'").order('"FeatureNumber"')
    end
    
  end

  # POST /context_features
  # POST /context_features.json
  def create
    @context_feature = ContextFeature.new(context_feature_params)
    @context_feature.EditorIDN = current_user.editor_id
    @context_feature.DateAdded = Time.now
    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    @in_context = []
    if @context_feature.project != nil
      @in_context = ContextFeature.joins(:project).where("\"tblProject\".\"ProjectID\" = '#{@context_feature.project.ProjectID}'").order('"FeatureNumber"')
    end
    respond_to do |format|
      if @context_feature.save
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @context_feature.id, :activity => "Created Feature #{@context_feature.FeatureNumber} for Project ID #{@context_feature.project != nil ? @context_feature.project.ProjectID : ''}")
        format.html { redirect_to edit_context_feature_path(@context_feature, anchor: anchor), notice: 'Feature was successfully created.' }
        format.json { render json: @context_feature, status: :created, location: @context_feature }
      else
        format.html { render action: "edit" }
        format.json { render json: @context_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /context_features/1
  # PUT /context_features/1.json
  def update
    @context_feature = ContextFeature.find(params[:id])
    @in_context = []
    if @context_feature.project != nil
      @in_context = ContextFeature.joins(:project).where("\"tblProject\".\"ProjectID\" = '#{@context_feature.project.ProjectID}'").order('"FeatureNumber"')
    end

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
    
      if @context_feature.update(context_feature_params)
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @context_feature.id, :activity => "Updated Feature #{@context_feature.FeatureNumber} for Project ID #{@context_feature.project != nil ? @context_feature.project.ProjectID : ''}")
        format.html { redirect_to edit_context_feature_path(@context_feature, anchor: anchor), notice: 'Feature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: 'uh oh' }
        format.json { render json: @context_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /context_features/1
  # DELETE /context_features/1.json
  def destroy
    @context_feature = ContextFeature.find(params[:id])
    activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @context_feature.id, :activity => "Deleted Feature #{@context_feature.FeatureNumber} for Project ID #{@context_feature.project != nil ? @context_feature.project.ProjectID : ''}")
    @context_feature.destroy

    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to context_features_url }
      format.json { head :no_content }
    end
  end
  
  def context_feature_ids
    samples = FeatureSample.includes(:project).where('"tblProject"."ProjectID" = ?',params[:project_id]).order('"FeatureSampleID"')
    
    # context_features = ContextFeature.where(['"ProjectID" ilike ?', params[:project_id]])
    ids = []
    # context_features.each do |context_feature|
    samples.each {|cs|
        ids << {:id => cs.id}
      }
    # end
    render :json => ids
  end
  
  def context_ids
    @contexts = Context.select('"ContextID"').where(['"ContextID" ilike ? and "ProjectID" = ?',"%#{params[:q]}%", params[:project_id]]).limit(10).order('"ContextID"')
    respond_to do |format|
      format.json { render json: @contexts }
    end    
  end
  
  
  def duplicate
    orig = ContextFeature.find(params[:id])
    @context_feature = ContextFeature.new
    @context_feature.ProjectID = orig.ProjectID
    @context_feature.Excavated = orig.Excavated
    @context_feature.LevelTypeID = orig.LevelTypeID
    @context_feature.DepositTypeID = orig.DepositTypeID
    @context_feature.LevelTypeID = orig.LevelTypeID
    @context_feature.UnitTypeID = orig.UnitTypeID
    @context_feature.SpatialDistribution = orig.SpatialDistribution
    @context_feature.ArtifactPresence = orig.ArtifactPresence
    @context_feature.QuadratID = orig.QuadratID
    
    @context_feature.EditorIDN = current_user.editor_id
    
    render action: 'edit'
  end
  
  
  private
  
  def context_feature_params
    # debugger
    params.require(:context_feature).permit( :FeatureNumber, :FeatureTypeID, :Description, :FeatureTPQ, :Length, :Width, :Depth, :OriginalPitCutLength, :OriginalPitCutWidth, :OriginalPitCutDepth, :PlanShapeID, :ProfileShapeID, :CentroidX, :CentroidY, :FeatureGroup, :FeatureGroupInterpretation, :ProjectID, :AssociatedQuadratID, :QuadratID, context_ids: [])
  end
end
