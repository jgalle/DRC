class GlassesController < ApplicationController
  # GET /glasses
  # GET /glasses.json
  def index
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    params[:query] = '' if params[:query] == 'Search'
    # if current_user.user_level >= 3
    @projects = current_user.projects.map{|p| p.ProjectID}
    # debugger
    if params[:artifacts] != 'my_artifacts'
      @total = Glass.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count
      @total_pages = Glass.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count / @per_page.to_i + 1
      @glasses = Glass.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").order('"ArtifactID"').page(params[:page]).per(@per_page)
    else
      @total = Glass.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count
      @total_pages = Glass.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count / @per_page.to_i + 1
      @glasses = Glass.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).order('"ArtifactID"').page(params[:page]).per(@per_page)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glasses }
    end
  end

  # GET /glasses/1
  # GET /glasses/1.json
  def show
    @glass = Glass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glass }
    end
  end

  # GET /glasses/new
  # GET /glasses/new.json
  def new
    @glass = Glass.new
    # @glass.EditorIDN = current_user.editor_id
    @in_context = []
    if params[:context_sample] != nil
      gca = GenerateContextArtifact.create(:ContextSampleID => params[:context_sample], :ArtifactID => '0')
      @in_context = Glass.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = ?", params[:context_sample]).order('"ArtifactID"')
      @glass.generate_context_artifact = gca
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Glass').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @glass.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @glass.context_sample.project.ProjectID
      @image_subtype = 'Glass'
    end

    respond_to do |format|
      format.html { render 'edit'}
      format.json { render json: @glass }
    end
  end

  # GET /glasses/1/edit
  def edit
    @glass = Glass.find(params[:id])
    # if @glass.project != nil
    #   @institution_id = @glass.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @glass.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @in_context = []
    if @glass.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Glass').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @glass.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @glass.context_sample.project.ProjectID
      @image_subtype = 'Glass'
      @in_context = Glass.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@glass.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
  end

  # POST /glasses
  # POST /glasses.json
  def create
    # debugger
    @glass = Glass.new(glass_params)
    # if @glass.project != nil
    #   @institution_id = @glass.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @glass.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @glass.EditorIDN = current_user.editor_id
    @in_context = []
    if @glass.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Glass').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @glass.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @glass.context_sample.project.ProjectID
      @image_subtype = 'Glass'
      @in_context = Glass.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@glass.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
    anchor = params[:active_tag] != '' ? params[:active_tag].gsub('#','') : ''

    respond_to do |format|
      if @glass.save
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @glass.id, :activity => "Created #{@glass.ArtifactID}")
        format.html { redirect_to edit_glass_path(@glass, anchor: anchor), notice: 'Glass was successfully created.' }
        format.json { render json: @glass, status: :created, location: @glass }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glasses/1
  # PUT /glasses/1.json
  def update
    @glass = Glass.find(params[:id])
    # if @glass.project != nil
    #   @institution_id = @glass.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @glass.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @glass.EditorID = current_user.editor_id
    @in_context = []
    if @glass.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Glass').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @glass.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @glass.context_sample.project.ProjectID
      @image_subtype = 'Glass'
      @in_context = Glass.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@glass.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
    puts "=====#{params[:active_tag]}"
    anchor = params[:active_tag] != '' ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @glass.update_attributes(glass_params)
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @glass.id, :activity => "Updated #{@glass.ArtifactID}")
        format.html { redirect_to edit_glass_path(@glass, anchor: anchor), notice: 'Glass was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glasses/1
  # DELETE /glasses/1.json
  def destroy
    @glass = Glass.find(params[:id])
    activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @glass.id, :activity => "Deleted #{@glass.ArtifactID}")
    @glass.destroy

    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to glasses_url }
      format.json { head :no_content }
    end
  end
  
  def duplicate
    orig = Glass.find(params[:id])
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
    @glass = Glass.new
    @glass.EditorIDN = current_user.editor_id
    @glass.generate_context_artifact = gca
    # @glass.generate_context_artifact.save
    @glass.GenerateContextArtifactID = @glass.generate_context_artifact.id
    @glass.EditorIDN = current_user.editor_id
    @glass.Quantity = orig.Quantity
    @glass.GlassMaterialID = orig.GlassMaterialID
    @glass.GlassBasicColorID = orig.GlassBasicColorID
    @glass.GlassVesselCategoryID = orig.GlassVesselCategoryID
    @glass.GlassFormID = orig.GlassFormID
    @glass.GlassCompletenessID = orig.GlassCompletenessID
    @glass.GlassManuTechID = orig.GlassManuTechID
    @glass.MoldTypeID = orig.MoldTypeID
    @glass.Mended = orig.Mended
    @glass.StemwareBodyShapeID = orig.StemwareBodyShapeID
    @glass.StemwareFootShapeID = orig.StemwareFootShapeID
    @glass.StemShapeID = orig.StemShapeID
    @glass.Burned = orig.Burned
    @glass.Patination = orig.Patination
    @glass.Solarized = orig.Solarized
    @glass.PMM = orig.PMM
    @glass.Notes = orig.Notes
    
    
    @glass.ArtifactID = ' - '
    # @ceramic.save
    # if @glass.project != nil
    #   @institution_id = @glass.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @glass.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @in_context = []
    if orig.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Glass').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @glass.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @glass.context_sample.project.ProjectID
      @image_subtype = 'Glass'
      @in_context = Glass.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{orig.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
    render action: 'edit'
  end
  
  def artifact_ids
    @glasses = Glass.select('"ArtifactID"','"GenerateContextArtifactID"').where(['"ArtifactID" ilike ?',"%#{params[:q]}%"]).limit(10).order('"ArtifactID"')
    respond_to do |format|
      format.json { render json: @glasses }
    end    
  end
  
  
  private
  
  def glass_params
    # debugger
    params.require(:glass).permit(:GenerateContextArtifactID, :Quantity, :GlassBasicColorID, :GlassMaterialID, :GlassVesselCategoryID, :GlassFormID, :GlassCompletenessID, :GlassManuTechID, :MoldTypeID, :Mended, :MendedYNID, :DecorationYN, :Notes, :SherdThickness, :SherdSize, :SherdWeight, :MendedSherdWeight, :LengthofRim, :RimDiameter, :MendedRimDiameter, :BaseLength, :BaseDiameter, :MendedBaseDiameter, :PontilMarkID, :TotalContainerHeight, :StemwareBodyShapeID, :StemwareFootShapeID, :StemShapeID, :StemLength, :Burned, :Patination, :Solarized, :PMM, :Conservation, glass_dec_techs_attributes: [:id, :_destroy, :GlassDecTechTypeID, :GlassDecTechBasicColorID, :GlassDecTechStyElemID], glass_marks_attributes: [:id, :_destroy, :Mark, :GlassMarkLocationID], glass_bottles_attributes: [:id, :_destroy, :GlassBottleElementID, :GlassBottleShapeID, :GlassBottleManuTechID], glass_mends_attributes: [:id, :_destroy, :MendsToArtifactID], :gen_object_artifacts_attributes => [:id, :_destroy, :ObjectID, :ArtifactID], artifact_images_attributes: [:id, :_destroy, :ImageID, :ArtifactID])
  end
  
end
