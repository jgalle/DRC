class ArtifactBoxesController < ApplicationController
  def index
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    params[:query] = '' if params[:query] == 'Search'
    # if current_user.user_level >= 3
    @projects = current_user.projects.map{|p| p.ProjectID}
    # debugger
    @total = 0
    if params[:query] == nil or params[:query] == ''
      if params[:artifacts] == 'all_artifacts'
        @total = ArtifactBox.all.count
        @total_pages = @total / @per_page.to_i + 1
        @artifact_boxes = ArtifactBox.all.order('"BoxID"').page(params[:page]).per(@per_page)
      else
        @total = ArtifactBox.where("\"EditorIDN\" = ?",current_user.editor_id).count
        @total_pages = @total / @per_page.to_i + 1
        @artifact_boxes = ArtifactBox.where("\"EditorIDN\" = ?", current_user.editor_id).order('"BoxID"').page(params[:page]).per(@per_page)
      end
    else
      if params[:artifacts] == 'all_artifacts'
        @total = ArtifactBox.includes(:project_name).where("cast(\"BoxID\" as varchar) ilike ? or \"tblArtifactBox\".\"ProjectID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ? or \"BoxLocation\" ilike ? or \"BoxNumber\" ilike ?", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%").count
        @total_pages = @total / @per_page.to_i + 1
        @artifact_boxes = ArtifactBox.includes(:project_name).where("cast(\"BoxID\" as varchar) ilike ? or \"tblArtifactBox\".\"ProjectID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ? or \"BoxLocation\" ilike ? or \"BoxNumber\" ilike ?", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%").order('"BoxID"').page(params[:page]).per(@per_page)
      else
        @total = ArtifactBox.includes(:project_name).where("(cast(\"BoxID\" as varchar) ilike ? or \"tblArtifactBox\".\"ProjectID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ? or \"BoxLocation\" ilike ? or \"BoxNumber\" ilike ?) and \"EditorIDN\" = ?", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%",current_user.editor_id).count
        @total_pages = @total / @per_page.to_i + 1
        @artifact_boxes = ArtifactBox.includes(:project_name).where("(cast(\"BoxID\" as varchar) ilike ? or \"tblArtifactBox\".\"ProjectID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ? or \"BoxLocation\" ilike ? or \"BoxNumber\" ilike ?) and \"EditorIDN\" = ?","%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%",current_user.editor_id).order('"BoxID"').page(params[:page]).per(@per_page)
      end
    end
    # if params[:query] == nil or params[:query] == ''
    #   if params[:artifacts] == 'all_artifacts'
    #     @total = ArtifactBox.all.count
    #     @total_pages = @total / @per_page.to_i + 1
    #     @artifact_boxes = ArtifactBox.all.order('"BoxID"').page(params[:page]).per(@per_page)
    #   else
    #     @total = ArtifactBox.where("\"BoxID\" = ? or \"ProjectID\" ilike ?", params[:query], "%#{params[:query]}%").count
    #     @total_pages = @total / @per_page.to_i + 1
    #     @artifact_boxes = ArtifactBox.where("\"BoxID\" = ? or \"ProjectID\" ilike ?", params[:query], "%#{params[:query]}%").order('"BoxID"').page(params[:page]).per(@per_page)
    #   end
    # else
    # end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artifact_boxes }
    end
  end

  # GET /glasses/1
  # GET /glasses/1.json
  def show
    @artifact_box = ArtifactBox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artifact_box }
    end
  end

  # GET /glasses/new
  # GET /glasses/new.json
  def new
    @artifact_box = ArtifactBox.new
    @contexts = Context.limit(100).order(:ContextID)
    # @artifact_box.EditorIDN = current_user.editor_id

    respond_to do |format|
      format.html { render 'edit'}
      format.json { render json: @artifact_box }
    end
  end

  # GET /glasses/1/edit
  def edit
    @artifact_box = ArtifactBox.find(params[:id])
    @contexts = Context.limit(100).order(:ContextID)
  end

  # POST /glasses
  # POST /glasses.json
  def create
    @artifact_box = ArtifactBox.new(artifact_boxes_params)
    @artifact_box.EditorIDN = current_user.editor_id

    anchor = params[:active_tag] != nil and params[:active_tag] != '' ? params[:active_tag].gsub('#','') : ''
    
    respond_to do |format|
      if @artifact_box.save
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @artifact_box.id, :activity => "Created Artifact Box #{@artifact_box.id}")
        format.html { redirect_to edit_artifact_box_path(@artifact_box, anchor: anchor), notice: 'ArtifactBox was successfully created.' }
        format.json { render json: @artifact_box, status: :created, location: @artifact_box }
      else
        format.html { render action: "edit" }
        format.json { render json: @artifact_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glasses/1
  # PUT /glasses/1.json
  def update
    @artifact_box = ArtifactBox.find(params[:id])
    @artifact_box.EditorID = current_user.editor_id
    @contexts = Context.limit(100).order(:ContextID)

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    puts "================#{anchor}"
    respond_to do |format|
      if @artifact_box.update_attributes(artifact_boxes_params)
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => params[:id], :activity => "Updated Artifact Box #{@artifact_box.id}")
        format.html { redirect_to edit_artifact_box_path(@artifact_box, anchor: anchor), notice: 'ArtifactBox was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @artifact_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glasses/1
  # DELETE /glasses/1.json
  def destroy
    @artifact_box = ArtifactBox.find(params[:id])
    activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @artifact_box.id, :activity => "Deleted Artifact Box #{@artifact_box.id}")
    @artifact_box.destroy

    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to artifact_boxes_url }
      format.json { head :no_content }
    end
  end
  
  def duplicate
    orig = ArtifactBox.find(params[:id])
    @artifact_box = ArtifactBox.new
    @artifact_box.EditorIDN = current_user.editor_id
    @contexts = Context.limit(100).order(:ContextID)
    render action: 'edit'
  end
  
  def context_info
    @context = Context.where('"tblContext"."ContextID" = ?', params['context_id']).first
    respond_to do |format|
      format.js {render 'context'}
    end    
  end
  
  def contexts
    @contexts = Context.includes(:project_name, :context_unit_type, :context_deposit_type).where("\"ContextID\" ilike ? or \"FeatureNumber\" ilike ? or \"QuadratID\" ilike ? or \"tblProjectName\".\"ProjectName\" ilike ? or \"tblContextUnitType\".\"UnitType\" ilike ? or \"tblContextDepositType\".\"DepositType\" ilike ?","%#{params[:query]}%", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%").references(:project_name, :context_unit_type, :context_deposit_type).limit(100).order('"ContextID"')
    respond_to do |format|
      format.js {render 'contexts'}
    end    
  end
  
  private
  
  def artifact_boxes_params
    # debugger
    params.require(:artifact_box).permit( :BoxLocation, :BoxNumber, :ProjectID, :ProjectYear, :Notes, context_artifact_boxes_attributes: [:id, :_destroy, :BoxID, :ContextID])
  end
end
