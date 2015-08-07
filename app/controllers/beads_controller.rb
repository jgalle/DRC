class BeadsController < ApplicationController
  # GET /beads
  # GET /beads.json
  def index
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    params[:query] = '' if params[:query] == 'Search'
    # if current_user.user_level >= 3
    @projects = current_user.projects.map{|p| p.ProjectID}
    # debugger
    @total = 0
    if params[:artifacts] != 'my_artifacts'
      @total = Bead.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count
      @total_pages = @total / @per_page.to_i + 1
      @beads = Bead.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").order('"ArtifactID"').page(params[:page]).per(@per_page)
    else
      @total = Bead.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count
      @total_pages = @total / @per_page.to_i + 1
      @beads = Bead.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).order('"ArtifactID"').page(params[:page]).per(@per_page)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @beads }
    end
  end

  # GET /glasses/1
  # GET /glasses/1.json
  def show
    @bead = Bead.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bead }
    end
  end

  # GET /glasses/new
  # GET /glasses/new.json
  def new
    @bead = Bead.new
    # @bead.EditorIDN = current_user.editor_id
    @in_context = []
    image_type = ImageType.where(:ImageType => 'Artifact').first
    image_subtype = ImageSubtype.where(:ImageSubtype => 'Bead').first
    # if @bead.project != nil
    #   @images = Image.joins(:projects).where('"ImageTypeID" = ? and "ImageSubtypeID" = ? and "tblProject"."ProjectID" = ?', image_type.id, image_subtype.id, @bead.project.ProjectID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.joins(:projects).where('"ImageTypeID" = ? and "ImageSubtypeID" = ? and "tblProject"."ProjectID" in (?)', image_type.id, image_subtype.id, current_user.edit_projects).limit(100).order('"DateAdded" desc')
    # end
    if params[:context_sample] != nil
      gca = GenerateContextArtifact.create(:ContextSampleID => params[:context_sample], :ArtifactID => '0')
      @in_context = Bead.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = ?", params[:context_sample]).order('"ArtifactID"')
      @bead.generate_context_artifact = gca
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Bead').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @bead.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @bead.context_sample.project.ProjectID
      @image_subtype = 'Bead'
    end
    respond_to do |format|
      format.html { render 'edit'}
      format.json { render json: @bead }
    end
  end

  # GET /glasses/1/edit
  def edit
    @bead = Bead.find(params[:id])
    # if @bead.project != nil
    #   @institution_id = @bead.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @bead.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @in_context = []
    if @bead.context_sample != nil
      @in_context = Bead.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@bead.context_sample.ContextSampleID}'").order('"ArtifactID"')
      image_type = ImageType.where(:ImageType => 'Artifact').first
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Bead').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @bead.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @bead.context_sample.project.ProjectID
      @image_subtype = 'Bead'
    end
  end

  # POST /glasses
  # POST /glasses.json
  def create
    @bead = Bead.new(beads_params)
    @bead.EditorIDN = current_user.editor_id
    # if @bead.project != nil
    #   @institution_id = @bead.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @bead.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @in_context = []
    if @bead.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Bead').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @bead.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @bead.context_sample.project.ProjectID
      @image_subtype = 'Bead'
      @in_context = Bead.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@bead.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end

    anchor = params[:active_tag] != nil and params[:active_tag] != '' ? params[:active_tag].gsub('#','') : ''
    
    respond_to do |format|
      if @bead.save
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @bead.id, :activity => "Created #{@bead.ArtifactID}")
        format.html { redirect_to edit_bead_path(@bead, anchor: anchor), notice: 'Bead was successfully created.' }
        format.json { render json: @bead, status: :created, location: @bead }
      else
        format.html { render action: "edit" }
        format.json { render json: @bead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glasses/1
  # PUT /glasses/1.json
  def update
    @bead = Bead.find(params[:id])
    @bead.EditorID = current_user.editor_id
    # if @bead.project != nil
    #   @institution_id = @bead.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @bead.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @in_context = []
    if @bead.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Bead').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @bead.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @bead.context_sample.project.ProjectID
      @image_subtype = 'Bead'
      @in_context = GenArtifact.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@bead.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    puts "================#{anchor}"
    respond_to do |format|
      if @bead.update_attributes(beads_params)
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => params[:id], :activity => "Updated #{@bead.ArtifactID}")
        format.html { redirect_to edit_bead_path(@bead, anchor: anchor), notice: 'Bead was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glasses/1
  # DELETE /glasses/1.json
  def destroy
    @bead = Bead.find(params[:id])
    activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @bead.id, :activity => "Deleted #{@bead.ArtifactID}")
    @bead.destroy

    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to beads_url }
      format.json { head :no_content }
    end
  end
  
  def duplicate
    orig = Bead.find(params[:id])
    gca = GenerateContextArtifact.new
    gca.ArtifactID = '0'
    gca.context_sample = orig.context_sample
    # if @bead.project != nil
    #   @institution_id = @bead.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @bead.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    # gca.save
    # max_artifact_id = GenerateContextArtifact.where('ContextSampleID' => orig.context_sample).maximum('ArtifactID')
    # if max_artifact_id != nil
    #   max_artifact_id = max_artifact_id.split('-').last.to_i + 1
    # else
    #   max_artifact_id = 1
    # end
    # gca.ArtifactID = "#{gca.ContextSampleID.gsub(';','')}-#{max_artifact_id.to_s.rjust(5,'0')}"
    gca.save
    @bead = Bead.new
    @bead.EditorIDN = current_user.editor_id
    @bead.generate_context_artifact = gca
    # @bead.generate_context_artifact.save
    @bead.GenerateContextArtifactID = @bead.generate_context_artifact.id
    @bead.EditorIDN = current_user.editor_id
    @bead.Quantity = orig.Quantity
    @bead.CompletenessID = orig.CompletenessID
    @bead.BeadMaterialID = orig.BeadMaterialID
    @bead.BeadManuTechID = orig.BeadManuTechID
    @bead.StructureID = orig.StructureID
    @bead.BeadFormID = orig.BeadFormID
    @bead.BeadShapeID = orig.BeadShapeID
    @bead.BeadComplexShapeID = orig.BeadComplexShapeID
    @bead.KiddBeadTypeID = orig.KiddBeadTypeID
    @bead.MunAppColorID = orig.MunAppColorID
    @bead.EndTreatmentID = orig.EndTreatmentID
    @bead.Mended = orig.Mended
    @bead.DiaphaneityID = orig.DiaphaneityID
    @bead.DecorationYN = orig.DecorationYN
    @bead.Burned = orig.Burned
    @bead.Patination = orig.Patination
    @bead.BeadWeatheredEroded = orig.BeadWeatheredEroded
    @bead.PMM = orig.PMM
    @bead.Conservation = orig.Conservation
    @bead.HeatTreated = orig.HeatTreated
    @bead.Notes = orig.Notes
    
    
    @bead.ArtifactID = ' - '
    # @ceramic.save
    @in_context = []
    if orig.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Bead').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @bead.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @bead.context_sample.project.ProjectID
      @image_subtype = 'Bead'
      @in_context = Bead.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{orig.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
    render action: 'edit'
  end
  
  def artifact_ids
    @beads = Bead.select('"ArtifactID"','"GenerateContextArtifactID"').where(['"ArtifactID" ilike ?',"%#{params[:q]}%"]).limit(10).order('"ArtifactID"')
    respond_to do |format|
      format.json { render json: @beads }
    end    
  end
  
  # def images
  #   @images = Image.includes(:image_type).where("\"ImageFileLocation\" ilike ? or \"ImageDescription\" ilike ? or \"Institution\" ilike ? or \"CatalogueNumber\" ilike ? or \"tblImageType\".\"ImageType\" ilike ?","%#{params[:query]}%", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%").limit(100).order('"ImageID"')
  #   respond_to do |format|
  #     format.js
  #   end    
  # end

  # def is_numeric(o)
  #   true if Integer(o) rescue false
  # end
  # 
  # def gen_objects
  #   if is_numeric(params[:query])
  #     @gen_objects = GenObject.includes(:gen_object_form, :gen_object_material, :gen_object_ware_type).references(:gen_object_form, :gen_object_material, :gen_object_ware_type).where("\"ObjectID\" = ? or \"ObjectDescription\" ilike ? or \"tblObjectForm\".\"ObjectForm\" ilike ? or \"tblCeramicWare\".\"Ware\" ilike ? or \"tblObjectMaterial\".\"ObjectMaterial\" ilike ?",params[:query], "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%").limit(100).order('"ObjectID"')
  # else
  #   @gen_objects = GenObject.includes(:gen_object_form, :gen_object_material, :gen_object_ware_type).references(:gen_object_form, :gen_object_material, :gen_object_ware_type).where("\"ObjectDescription\" ilike ? or \"tblObjectForm\".\"ObjectForm\" ilike ? or \"tblCeramicWare\".\"Ware\" ilike ? or \"tblObjectMaterial\".\"ObjectMaterial\" ilike ?", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%").limit(100).order('"ObjectID"')
  # end
  #   respond_to do |format|
  #     format.js
  #   end    
  # end
  # 
  # def image_info
  #   @image = Image.where('"tblImage"."ImageID" = ?', params['image_id']).first
  #   respond_to do |format|
  #     format.js
  #   end    
  # end
  # 
  # def object_info
  #   @gen_object = GenObject.where('"tblObject"."ObjectID" = ?', params['object_id']).first
  #   respond_to do |format|
  #     format.js
  #   end    
  # end
  
  private
  
  def beads_params
    # debugger
    params.require(:bead).permit(:GenerateContextArtifactID, :Quantity, :CompletenessID, :BeadMaterialID, :BeadManuTechID, :StructureID, :BeadFormID, :BeadShapeID, :BeadComplexShapeID, :KiddBeadTypeID, :BeadBasicColorID, :EndTreatmentID, :HeatTreated, :DiaphaneityID, :Mended, :MendedYNID, :DecorationYN, :Notes, :Length, :Height, :Width, :SizeofPerforationI, :SizeofPerforationII, :Weight, :NumberofFacets, :Burned, :Patination, :BeadWeatheredEroded, :PMM, :Conservation, :MunAppColorID, bead_casings_attributes: [:id, :_destroy, :CasingLayerID, :BeadCasingBasicColorID, :MunAppColorID], bead_dec_techs_attributes: [:id, :_destroy, :BeadDecorationID, :BeadDecorationBasicColorID, :DecDescription, :MunAppColorID], :gen_object_artifacts_attributes => [:id, :_destroy, :ObjectID, :ArtifactID], artifact_images_attributes: [:id, :_destroy, :ImageID, :ArtifactID])
  end
end
