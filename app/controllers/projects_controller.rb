class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  
  before_filter :authenticate_user!
  before_filter :check_user_permissions, :only => [:edit]
  # helper_method :sort_column, :sort_direction

  def index
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    
    if params[:query] == nil or params[:query] == ''
      institutions = []
      if current_user.is_admin?
        @projects = Project.includes(:project_name).references(:project_name).order("\"tblProject\".\"ProjectID\"").page(@page).per(@per_page)
        @total = Project.all().count
        @total_pages = Project.all().count / @per_page.to_i + 1
      else
        # institutions = ProjectInstitution.where('"InstitutionID" = ?', "#{current_user.organization_id}")
        # institutions_str = institutions.map { |t| "\"InstitutionID\" = '#{t.id}'" }.join(" OR ")
        @projects = current_user.projects.order("\"tblProject\".\"ProjectID\"").includes(:project_name).references(:project_name).page(@page).per(@per_page)
        @total = current_user.projects.count
        @total_pages = current_user.projects.count / @per_page.to_i + 1
      end
    else
      projects = ProjectName.where('"ProjectName" ilike ?', "%#{params[:query]}%".gsub('*','%'))
      # if current_user.user_level >= 3
        institutions = ProjectInstitution.where('"Institution" ilike ?', "%#{params[:query]}%".gsub('*','%'))
      # else
      #   # redundant because only one institution
      #   institutions = ProjectInstitution.where("(\"Institution\" ilike ? and \"InstitutionID\"='#{current_user.organization_id}')", "%#{params[:query]}%")
      #   institutions_str = institutions.map { |t| "\"InstitutionID\" = '#{t.id}'" }.join(" OR ")
      # end
      # project_ids = projects.map {|p| p.id}
      # institution_ids = institutions.map {|p| p.id}
      # project_id_str = current_user.projects.map { |t| "\"ProjectID\" ilike '#{params[:query]}'" }.join(" OR ")
      # str = project_id_str
      str = ''
      project_str = projects.map { |t| "\"ProjectNameID\" = #{t.id}" }.join(" OR ")
      if str != '' and project_str != ''
        str += " or #{project_str}"
      elsif str == ''
        str = project_str
      end
      institutions_str = institutions.map { |t| "\"InstitutionID\" = #{t.id}" }.join(" OR ")
      if str != '' and institutions_str != ''
        str += " or #{institutions_str}"
      elsif str == ''
        str = institutions_str
      end
      
      # str = ''
      if current_user.user_level < 3
        projects_str = current_user.projects.map {|p| "\"ProjectID\" = '#{p.ProjectID}'" }.join(" OR ")
      else 
        projects_str = Project.all.map {|p| "\"ProjectID\" = '#{p.ProjectID}'" }.join(" OR ")
      end
      # debugger
      if str != ''
        projects_str = "(#{projects_str}) and (#{str} or \"ProjectID\" ilike ?)" 
      else
        projects_str = "(#{projects_str}) and (\"ProjectID\" ilike ?)" 
      end
      puts "--->----------#{projects_str}"
      @projects = Project.where(projects_str, "%#{params[:query]}%".gsub('*','%')).page(@page).per(@per_page)
      @total = Project.where(projects_str, "%#{params[:query]}%".gsub('*','%')).count
      @total_pages = Project.where(projects_str, "%#{params[:query]}%".gsub('*','%')).count / @per_page.to_i + 1
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    redirect_to :action => 'edit', :id => params[:id]
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @project }
    # end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html { render action: 'edit'}
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    @images = Image.limit(100).order('"DateAdded" desc')
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.EditorIDN = current_user.editor_id
    @images = Image.limit(100).order('"DateAdded" desc')

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @project.save
        # current_user.projects << @project
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @project.id, :activity => "Created Project #{@project.ProjectID}")
        format.html { redirect_to edit_project_path(@project, anchor: anchor), notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    @project.EditorID = current_user.editor_id
    @images = Image.limit(100).order('"DateAdded" desc')

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @project.update(project_params)
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @project.id, :activity => "Updated Project #{@project.ProjectID}")
        format.html { redirect_to edit_project_path(@project, anchor: anchor), notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @project.id, :activity => "Deleted Project #{@project.ProjectID}")
    @project.destroy

    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
  
  private
    # def sort_column
    #   params[:sort] || "project_id"
    # end
    # 
    # def sort_direction
    #   params[:direction] || "asc"
    # end
    
  def check_user_permissions
    if current_user.user_level >= 3
      true
    else
      p = Project.find params[:id]
      if !current_user.projects.include?(p)
        redirect_to :action => :show, :id => params[:id]
      end
    end
  end
  
  def project_params
    # debugger
    params.require(:project).permit(:id, :SiteAbstract, :ProjectID, :InstitutionID, :ProjectNameID, :ProjectCountryID, :RegionID, :State, :CountyID, :PlaceNameID, :BeginDate, :EndDate, :StateSiteNumber, :UnitofMeasureID, :DrainageID, :SiteSoils, :NearestWaterSource, :DistancefromWaterSource, :ElevationTypeID, :TotalAreaExcavated, :TotalConvexHull, :DatesExcavated, :ArtifactRepositoryID, :BeginDate, :EndDate, :ProjectTag, :LevelofTreatmentID, :ProjectNotes, :GeoDatumID, :GeoCoordinateSystemID, :NorthingGeoCoordinateofLocalDatum, :EastingGeoCoordinateofLocalDatum, :VerticalGeoCoordinateofLocalDatum, :PlantationID, :AzimuthOrientation, :WebsiteRegionID,:ProjectStateID, images_attributes: [:id, :ImageID, :ImageFileLocation ,:ImageTypeID, :ImageDescription, :Institution, :CatalogueNumber, :_destroy], project_images_attributes: [:id, :_destroy, :ImageID, :ProjectID])
  end
end
