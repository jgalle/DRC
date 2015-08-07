class BucklesController < ApplicationController
  # GET /buckles
  # GET /buckles.json
  def index
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    params[:query] = '' if params[:query] == 'Search'
    # if current_user.user_level >= 3
    @projects = current_user.projects.map{|p| p.ProjectID}
    # debugger
    @total = 0
    if params[:artifacts] != 'my_artifacts'
      @total = Buckle.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count
      @total_pages = Buckle.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count / @per_page.to_i + 1
      @buckles = Buckle.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").order('"ArtifactID"').page(params[:page]).per(@per_page)
    else
      @total = Buckle.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count
      @total_pages = Buckle.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count / @per_page.to_i + 1
      @buckles = Buckle.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).order('"ArtifactID"').page(params[:page]).per(@per_page)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buckles }
    end
  end

  # GET /glasses/1
  # GET /glasses/1.json
  def show
    @buckle = Buckle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buckle }
    end
  end

  # GET /glasses/new
  # GET /glasses/new.json
  def new
    @buckle = Buckle.new
    # @buckle.EditorIDN = current_user.editor_id
    @in_context = []
    if params[:context_sample] != nil
      gca = GenerateContextArtifact.create(:ContextSampleID => params[:context_sample], :ArtifactID => '0')
      @in_context = Buckle.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = ?", params[:context_sample]).order('"ArtifactID"')
      @buckle.generate_context_artifact = gca
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Buckle').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @buckle.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @buckle.context_sample.project.ProjectID
      @image_subtype = 'Buckle'
    end

    respond_to do |format|
      format.html { render 'edit'}
      format.json { render json: @buckle }
    end
  end

  # GET /glasses/1/edit
  def edit
    @buckle = Buckle.find(params[:id])
    # if @buckle.project != nil
    #   @institution_id = @buckle.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @buckle.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @in_context = []
    if @buckle.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Buckle').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @buckle.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @buckle.context_sample.project.ProjectID
      @image_subtype = 'Buckle'
      @in_context = Buckle.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@buckle.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
  end

  # POST /glasses
  # POST /glasses.json
  def create
    @buckle = Buckle.new(buckles_params)
    # if @buckle.project != nil
    #   @institution_id = @buckle.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @buckle.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @buckle.EditorIDN = current_user.editor_id
    @in_context = []
    if @buckle.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Buckle').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @buckle.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @buckle.context_sample.project.ProjectID
      @image_subtype = 'Buckle'
      @in_context = Buckle.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@buckle.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @buckle.save
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @buckle.id, :activity => "Created #{@buckle.ArtifactID}")
        format.html { redirect_to edit_buckle_path(@buckle, anchor: anchor), notice: 'Buckle was successfully created.' }
        format.json { render json: @buckle, status: :created, location: @buckle }
      else
        format.html { render action: "edit" }
        format.json { render json: @buckle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glasses/1
  # PUT /glasses/1.json
  def update
    @buckle = Buckle.find(params[:id])
    # if @buckle.project != nil
    #   @institution_id = @buckle.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @buckle.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @buckle.EditorID = current_user.editor_id
    @in_context = []
    if @buckle.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Buckle').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @buckle.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @buckle.context_sample.project.ProjectID
      @image_subtype = 'Buckle'
      @in_context = GenArtifact.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@buckle.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @buckle.update_attributes(buckles_params)
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @buckle.id, :activity => "Updated #{@buckle.ArtifactID}")
        
        format.html { redirect_to edit_buckle_path(@buckle, anchor: anchor), notice: 'Buckle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buckle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glasses/1
  # DELETE /glasses/1.json
  def destroy
    @buckle = Buckle.find(params[:id])
    activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @buckle.id, :activity => "Deleted #{@buckle.ArtifactID}")
    @buckle.destroy

    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to buckles_url }
      format.json { head :no_content }
    end
  end
  
  def duplicate
    orig = Buckle.find(params[:id])
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
    @buckle = Buckle.new
    @buckle.EditorIDN = current_user.editor_id
    @buckle.generate_context_artifact = gca
    # @buckle.generate_context_artifact.save
    @buckle.GenerateContextArtifactID = @buckle.generate_context_artifact.id
    @buckle.EditorIDN = current_user.editor_id
    @buckle.Quantity = orig.Quantity
    @buckle.BuckleCompletenessID = orig.BuckleCompletenessID
    @buckle.BuckleTypeID = orig.BuckleTypeID
    @buckle.Mended = orig.Mended
    @buckle.DecorationYN = orig.DecorationYN
    @buckle.Marks = orig.Marks
    @buckle.FramePlatingID = orig.FramePlatingID
    @buckle.Burned = orig.Burned
    @buckle.PMM = orig.PMM
    @buckle.Conservation = orig.Conservation
    @buckle.Notes = orig.Notes
    
    
    @buckle.ArtifactID = ' - '
    # @ceramic.save
    # if @buckle.project != nil
    #   @institution_id = @buckle.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @buckle.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @in_context = []
    if orig.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Buckle').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @buckle.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @buckle.context_sample.project.ProjectID
      @image_subtype = 'Buckle'
      @in_context = Buckle.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{orig.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
    render action: 'edit'
  end
  
  def artifact_ids
    @buckles = Buckle.select('"ArtifactID"','"GenerateContextArtifactID"').where(['"ArtifactID" ilike ?',"%#{params[:q]}%"]).limit(10).order('"ArtifactID"')
    respond_to do |format|
      format.json { render json: @buckles }
    end    
  end
  
  
  private
  
  def buckles_params
    # debugger
    params.require(:buckle).permit(:GenerateContextArtifactID,  :Quantity, :BuckleCompletenessID, :BuckleTypeID, :Weight, :Mended, :MendedYNID, :Notes, :Marks, :FramePlatingID, :Burned, :PMM, :Conservation, buckle_forms_attributes: [:id, :_destroy, :BucklePartID, :BuckleMaterialID, :BuckleManuTechID, :BuckleShapeID, :BuckleElementID, :Length, :Width, :PinCenterpointMeasure], buckle_dec_techs_attributes: [:id, :_destroy, :BuckleDecTechTypeID, :BuckleDecMotifID], :gen_object_artifacts_attributes => [:id, :_destroy, :ObjectID, :ArtifactID], artifact_images_attributes: [:id, :_destroy, :ImageID, :ArtifactID])
  end
end
