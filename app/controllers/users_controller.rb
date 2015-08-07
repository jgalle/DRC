class UsersController < ApplicationController
  before_filter :check_for_admin
  helper_method :sort_column, :sort_direction
  
  # GET /yes_nos
  # GET /yes_nos.json
  def index
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    params[:query] = '' if params[:query] == 'Search'
    @total = User.eager_load(:project_institution).where("\"userid\" ilike ? or \"first_name\" ilike ? or \"last_name\" ilike ?","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%").count
    @total_pages = User.eager_load(:project_institution).where("\"userid\" ilike ? or \"first_name\" ilike ? or \"last_name\" ilike ?","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%").count / @per_page.to_i + 1
    @users = User.eager_load(:project_institution).where("\"userid\" ilike ? or \"first_name\" ilike ? or \"last_name\" ilike ?","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%").order(:userid).page(params[:page]).per(@per_page)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.editor = Editor.new
    @institutions = {}
    
    respond_to do |format|
      format.html { render action: 'edit'}
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
    @institutions = {}
    @user.projects.map{|p| @institutions[p.InstitutionID] = ProjectInstitution.find p.InstitutionID}
  end
  
  def create
    @user = User.new(user_params)
    @institutions = {}

    respond_to do |format|
      
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    # if params[:user] != nil and params[:user][:user_permissions_attributes] != nil
    #   params[:user][:user_permissions_attributes].each do |k,v|
    #     if v[:project_ids] == nil
    #       # v[:project_ids] = []
    #     end
    #   end
    # end
    @institutions = {}
    @user.projects.map{|p| @institutions[p.InstitutionID] = ProjectInstitution.find p.InstitutionID}
    # debugger
    # puts "-------->#{params['password']}"
    respond_to do |format|
      if params[:user][:password] != '' ? @user.update(user_params) : @user.update_without_password(user_params)
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def all_projects
    @organization_id = params[:id]
    @name = params[:name].gsub('user_level','project_ids')
    @institution = ProjectInstitution.find params[:id]
    render :partial => 'all_projects' 
  end
  
  def check_for_admin
    if current_user != nil and current_user.user_level > 3
      return true
    elsif current_user != nil and current_user.id.to_s == params[:id]
      return true
    else
      redirect_to :controller => 'homepage', :action => 'dashboard'
    end
  end

  private
    def sort_column
      params[:sort] || "userid"
    end

    def sort_direction
      params[:direction] || "asc"
    end
    
    def needs_password?(user, user_params)
      !user_params[:password].blank?
    end
    
    def user_params
      params.require(:user).permit(:userid, :password, :email, :password_confirmation, :organization_id, :user_level, :first_name, :last_name, user_permissions_attributes: [:id, :_destroy, :user_level, :project_ids => []])
    end
end
