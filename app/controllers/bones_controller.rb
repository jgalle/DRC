class BonesController < ApplicationController
  # GET /bones
  # GET /bones.json
  def index
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    params[:query] = '' if params[:query] == 'Search'
    # if current_user.user_level >= 3
    @projects = current_user.projects.map{|p| p.ProjectID}
    # debugger
    @total = 0
    if params[:artifacts] != 'my_artifacts'
      @total = Bone.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count
      @total_pages = Bone.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count / @per_page.to_i + 1
      @bones = Bone.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").order('"ArtifactID"').page(params[:page]).per(@per_page)
    else
      @total = Bone.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count
      @total_pages = Bone.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count / @per_page.to_i + 1
      @bones = Bone.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).order('"ArtifactID"').page(params[:page]).per(@per_page)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bones }
    end
  end

  # GET /glasses/1
  # GET /glasses/1.json
  def show
    @bone = Bone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bone }
    end
  end

  # GET /glasses/new
  # GET /glasses/new.json
  def new
    @bone = Bone.new
    # @bone.EditorIDN = current_user.editor_id
    @in_context = []
    if params[:context_sample] != nil
      gca = GenerateContextArtifact.create(:ContextSampleID => params[:context_sample], :ArtifactID => '0')
      @in_context = Bone.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = ?", params[:context_sample]).order('"ArtifactID"')
      @bone.generate_context_artifact = gca
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Faunal').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @bone.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @bone.context_sample.project.ProjectID
      @image_subtype = 'Faunal'
    end

    respond_to do |format|
      format.html { render 'edit'}
      format.json { render json: @bone }
    end
  end

  # GET /glasses/1/edit
  def edit
    @bone = Bone.find(params[:id])
    # @images = Image.limit(100).order(:ImageID)
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @in_context = []
    if @bone.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Faunal').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @bone.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @bone.context_sample.project.ProjectID
      @image_subtype = 'Faunal'
      @in_context = Bone.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@bone.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
  end

  # POST /glasses
  # POST /glasses.json
  def create
    @bone = Bone.new(bones_params)
    # @images = Image.limit(100).order(:ImageID)
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @bone.EditorIDN = current_user.editor_id
    @in_context = []
    if @bone.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Faunal').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @bone.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @bone.context_sample.project.ProjectID
      @image_subtype = 'Faunal'
      @in_context = Bone.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@bone.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''

    respond_to do |format|
      if @bone.save
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @bone.id, :activity => "Created #{@bone.ArtifactID}")
        format.html { redirect_to edit_bone_path(@bone, anchor: anchor), notice: 'Bone was successfully created.' }
        format.json { render json: @bone, status: :created, location: @bone }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glasses/1
  # PUT /glasses/1.json
  def update
    @bone = Bone.find(params[:id])
    # @images = Image.limit(100).order(:ImageID)
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @bone.EditorID = current_user.editor_id
    @in_context = []
    if @bone.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Faunal').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @bone.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @bone.context_sample.project.ProjectID
      @image_subtype = 'Faunal'
      @in_context = Bone.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@bone.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @bone.update_attributes(bones_params)
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @bone.id, :activity => "Updated #{@bone.ArtifactID}")
        format.html { redirect_to edit_bone_path(@bone, anchor: anchor), notice: 'Bone was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glasses/1
  # DELETE /glasses/1.json
  def destroy
    @bone = Bone.find(params[:id])
    @bone.destroy

    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to bones_url }
      format.json { head :no_content }
    end
  end
  
  def duplicate
    orig = Bone.find(params[:id])
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
    @bone = Bone.new
    @bone.EditorIDN = current_user.editor_id
    @bone.generate_context_artifact = gca
    # @bone.generate_context_artifact.save
    @bone.GenerateContextArtifactID = @bone.generate_context_artifact.id
    @bone.EditorIDN = current_user.editor_id
    @bone.Quantity = orig.Quantity
    @bone.ReliabilityID = orig.ReliabilityID
    @bone.TaxonID = orig.TaxonID
    @bone.BoneElementID = orig.BoneElementID
    @bone.SymmetryID = orig.SymmetryID
    @bone.NISP = orig.NISP
    @bone.Weight = orig.Weight
    @bone.BoneLocationID = orig.BoneLocationID
    @bone.DescriptorID = orig.DescriptorID
    @bone.BoneSizeID = orig.BoneSizeID
    @bone.FusionID = orig.FusionID
    @bone.SexID = orig.SexID
    @bone.ChewTypeID = orig.ChewTypeID
    @bone.ChewLocationID = orig.ChewLocationID
    @bone.FreshBreak = orig.FreshBreak
    @bone.Identifier = orig.Identifier
    @bone.DateIdentified = orig.DateIdentified
    @bone.ToothTypeID = orig.ToothTypeID
    @bone.ToothWearID = orig.ToothWearID
    @bone.Disease = orig.Disease
    @bone.Weathered = orig.Weathered
    @bone.Burned = orig.Burned
    @bone.BoneConditionID = orig.BoneConditionID
    @bone.Comments = orig.Comments
    
    
    @bone.ArtifactID = ' - '
    # @ceramic.save
    @in_context = []
    if orig.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Faunal').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @bone.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @bone.context_sample.project.ProjectID
      @image_subtype = 'Faunal'
      @in_context = Bone.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{orig.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
    render action: 'edit'
  end
  
  def artifact_ids
    @bones = Bone.select('"ArtifactID"','"GenerateContextArtifactID"').where(['"ArtifactID" ilike ?',"%#{params[:q]}%"]).limit(10).order('"ArtifactID"')
    respond_to do |format|
      format.json { render json: @bones }
    end    
  end
  
  
  private
  
  def bones_params
    # debugger
    params.require(:bone).permit(:GenerateContextArtifactID, :Quantity, :ReliabilityID, :TaxonID, :BoneElementID, :SymmetryID, :NISP, :Weight, :BoneLocationID, :DescriptorID, :BoneSizeID, :FusionID, :SexID, :ChewTypeID, :ChewLocationID, :FreshBreak, :Identifier, :DateIdentified, :ToothTypeID, :ToothWearID, :Disease, :Weathered, :Burned, :BoneConditionID, :NoofCutMarks, :ButcherMethodID, :ButcherLocationID, :ButcherDirectionID, :BoneMarkTypeID, :MarkDirectionID, :BoneMarkLocationID, :Comments, bone_measures_attributes: [:id, :_destroy, :MeasuringDescriptionID, :Measurement, :Accurate], :gen_object_artifacts_attributes => [:id, :_destroy, :ObjectID, :ArtifactID], artifact_images_attributes: [:id, :_destroy, :ImageID, :ArtifactID])
  end
  
end
