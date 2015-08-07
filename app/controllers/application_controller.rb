class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!, :except => [:about, :project_team, :partners, :sponsors, :research, :show, :artifact_query_five, :search, :aq_one, :aq_one_results, :aq_two, :aq_two_results, :aq_three, :aq_three_results, :query_context_one, :query_context_one_results, :query_objects, :query_objects_results, :query_context_one, :query_context_one_results, :query_objects_two, :query_objects_two_results, :query_objects_three, :query_objects_three_results, :query_sites, :query_sites_results, :mcd_one, :mcd_one_results, :mcd_two, :mcd_two_results, :query_one_image, :query_one_image_results, :query_two_image, :query_two_image_results, :image_forms, :query_context_two, :query_context_two_results, :query_faunal_two, :query_faunal_two_results]

  before_filter :set_last_seen_at, if: proc { |p| user_signed_in? && (session[:last_seen_at] == nil || session[:last_seen_at] < 15.minutes.ago) }

  layout :layout_by_resource
  
  before_filter :set_current_user

   def set_current_user
     User.current = current_user
   end

  # def images
  #   if params[:institution] != nil and params[:instution] != ''
  #     @images = Image.includes(:image_type).where("\"ImageFileLocation\" ilike ? or \"ImageDescription\" ilike ? or \"Institution\" ilike ? or \"CatalogueNumber\" ilike ? or \"tblImageType\".\"ImageType\" ilike ?","%#{params[:query]}%", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%").references(:image_type).limit(100).order('"DateAdded" desc')
  #   else
  #     @images = Image.includes(:image_type).where("\"InstitutionID\" and (\"ImageFileLocation\" ilike ? or \"ImageDescription\" ilike ? or \"Institution\" ilike ? or \"CatalogueNumber\" ilike ? or \"tblImageType\".\"ImageType\" ilike ?)","%#{params[:query]}%", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%").references(:image_type).limit(100).order('"DateAdded" desc')
  #   end
  #   respond_to do |format|
  #     format.js {render 'partials/images'}
  #   end    
  # end

  def images
    image_subtypes = ImageSubtype.where(:ImageSubtype => params['image_subtype']).map {|i| i.ImageSubtypeID}
    # @images = Image.includes(:image_type).joins(:projects).where("(\"ImageFileLocation\" ilike ? or \"ImageDescription\" ilike ? or \"Institution\" ilike ? or \"CatalogueNumber\" ilike ? or \"tblImageType\".\"ImageType\" ilike ?) and (\"ImageSubtypeID\" in (?) and \"tblProject\".\"ProjectID\" = ?)","%#{params[:query]}%", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%", image_subtypes, params[:project_id]).references(:image_type).limit(100).order('"tblImage"."DateAdded" desc')
    if params[:query] != nil and params[:query] != ''
      @images = Image.joins(:projects).where("(\"ImageID\"::text ilike ? or \"CatalogueNumber\" ilike ?) and (\"ImageSubtypeID\" in (?) and \"tblProject\".\"ProjectID\" = ?)","#{params[:query]}", "%#{params[:query]}%", image_subtypes, params[:project_id]).limit(100).order('"tblImage"."DateAdded" desc')
    else
      @images = Image.joins(:projects).where("(\"ImageSubtypeID\" in (?) and \"tblProject\".\"ProjectID\" = ?)", image_subtypes, params[:project_id]).limit(100).order('"tblImage"."DateAdded" desc')
    end
    @project_id = params[:project_id]
    @image_type = params[:image_type]
    @image_subtype = params[:image_subtype]
    respond_to do |format|
      format.js {render 'partials/images'}
    end    
  end

  def is_numeric(o)
    true if Integer(o) rescue false
  end
  
  def gen_objects
    if is_numeric(params[:query])
      @gen_objects = GenObject.includes(:gen_object_form, :gen_object_material, :gen_object_ware_type).references(:gen_object_form, :gen_object_material, :gen_object_ware_type).where("\"ObjectID\" = ? or \"ObjectDescription\" ilike ? or \"tblObjectForm\".\"ObjectForm\" ilike ? or \"tblCeramicWare\".\"Ware\" ilike ? or \"tblObjectMaterial\".\"ObjectMaterial\" ilike ?",params[:query], "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%").limit(100).order('"ObjectID"')
  else
    @gen_objects = GenObject.includes(:gen_object_form, :gen_object_material, :gen_object_ware_type).references(:gen_object_form, :gen_object_material, :gen_object_ware_type).where("\"ObjectDescription\" ilike ? or \"tblObjectForm\".\"ObjectForm\" ilike ? or \"tblCeramicWare\".\"Ware\" ilike ? or \"tblObjectMaterial\".\"ObjectMaterial\" ilike ?", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%").limit(100).order('"ObjectID"')
  end
    respond_to do |format|
      format.js {render 'partials/gen_objects'}
    end    
  end
  
  def image_info
    @image = Image.where('"tblImage"."ImageID" = ?', params['image_id']).first
    respond_to do |format|
      format.js {render 'partials/image_info'}
    end    
  end

  def object_info
    @gen_object = GenObject.where('"tblObject"."ObjectID" = ?', params['object_id']).first
    respond_to do |format|
      format.js {render 'partials/object_info'}
    end    
  end
  
  protected

   def layout_by_resource
     if devise_controller?
       "homepage"
     else
       "application"
     end
   end
   
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) << :userid
  end
  
  private
  def set_last_seen_at
    current_user.update_attribute(:last_seen_at, Time.now)
    session[:last_seen_at] = Time.now
  end
end
