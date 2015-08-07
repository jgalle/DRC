class TobaccoPipesController < ApplicationController
  # GET /tobacco_pipes
  # GET /tobacco_pipes.json
  def index
    @tobacco_pipes = TobaccoPipe.all
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    params[:query] = '' if params[:query] == 'Search'
    # if current_user.user_level >= 3
    @projects = current_user.projects.map{|p| p.ProjectID}
    # debugger
    if params[:artifacts] != 'my_artifacts'
      @total = TobaccoPipe.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count
      @total_pages = TobaccoPipe.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").count / @per_page.to_i + 1
      @tobacco_pipes = TobaccoPipe.where("\"ArtifactID\" ilike ?","%#{params[:query]}%").order('"ArtifactID"').page(params[:page]).per(@per_page)
    else
      @total = TobaccoPipe.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count
      @total_pages = TobaccoPipe.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).count / @per_page.to_i + 1
      @tobacco_pipes = TobaccoPipe.where("\"ArtifactID\" ilike ? and \"EditorIDN\" = ?","%#{params[:query]}%",current_user.editor_id).order('"ArtifactID"').page(params[:page]).per(@per_page)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tobacco_pipes }
    end
  end

  # GET /tobacco_pipes/1
  # GET /tobacco_pipes/1.json
  def show
    @tobacco_pipe = TobaccoPipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tobacco_pipe }
    end
  end

  # GET /tobacco_pipes/new
  # GET /tobacco_pipes/new.json
  def new
    @tobacco_pipe = TobaccoPipe.new
    # @tobacco_pipe.EditorIDN = current_user.editor_id
    @in_context = []
    if params[:context_sample] != nil
      gca = GenerateContextArtifact.create(:ContextSampleID => params[:context_sample], :ArtifactID => '0')
      @in_context = TobaccoPipe.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = ?", params[:context_sample]).order('"ArtifactID"')
      @tobacco_pipe.generate_context_artifact = gca
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Tobacco Pipes').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @tobacco_pipe.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @tobacco_pipe.context_sample.project.ProjectID
      @image_subtype = 'Tobacco Pipes'
    end

    respond_to do |format|
      format.html { render 'edit'}
      format.json { render json: @tobacco_pipe }
    end
  end

  # GET /tobacco_pipes/1/edit
  def edit
    @tobacco_pipe = TobaccoPipe.find(params[:id])
    # if @tobacco_pipe.project != nil
    #   @institution_id = @tobacco_pipe.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @tobacco_pipe.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @in_context = []
    if @tobacco_pipe.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Tobacco Pipes').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @tobacco_pipe.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @tobacco_pipe.context_sample.project.ProjectID
      @image_subtype = 'Tobacco Pipes'
      @in_context = TobaccoPipe.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@tobacco_pipe.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
  end

  # POST /tobacco_pipes
  # POST /tobacco_pipes.json
  def create
    @tobacco_pipe = TobaccoPipe.new(tobacco_pipe_params)
    # if @tobacco_pipe.project != nil
    #   @institution_id = @tobacco_pipe.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @tobacco_pipe.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @tobacco_pipe.EditorIDN = current_user.editor_id
    @in_context = []
    if @tobacco_pipe.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Tobacco Pipes').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @tobacco_pipe.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @tobacco_pipe.context_sample.project.ProjectID
      @image_subtype = 'Tobacco Pipes'
      @in_context = Glass.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@tobacco_pipe.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @tobacco_pipe.save
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @tobacco_pipe.id, :activity => "Created #{@tobacco_pipe.ArtifactID}")
        format.html { redirect_to edit_tobacco_pipe_path(@tobacco_pipe, anchor: anchor), notice: 'Tobacco pipe was successfully created.' }
        format.json { render json: @tobacco_pipe, status: :created, location: @tobacco_pipe }
      else
        format.html { render action: "new" }
        format.json { render json: @tobacco_pipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tobacco_pipes/1
  # PUT /tobacco_pipes/1.json
  def update
    @tobacco_pipe = TobaccoPipe.find(params[:id])
    # if @tobacco_pipe.project != nil
    #   @institution_id = @tobacco_pipe.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @tobacco_pipe.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @gen_objects = GenObject.limit(100).order(:ObjectID)
    @tobacco_pipe.EditorID = current_user.editor_id
    @in_context = []
    if @tobacco_pipe.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Tobacco Pipes').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @tobacco_pipe.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @tobacco_pipe.context_sample.project.ProjectID
      @image_subtype = 'Tobacco Pipes'
      @in_context = TobaccoPipe.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{@tobacco_pipe.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end

    anchor = (params[:active_tag] != nil and params[:active_tag] != '') ? params[:active_tag].gsub('#','') : ''
    respond_to do |format|
      if @tobacco_pipe.update_attributes(tobacco_pipe_params)
        activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @tobacco_pipe.id, :activity => "Updated #{@tobacco_pipe.ArtifactID}")
        format.html { redirect_to edit_tobacco_pipe_path(@tobacco_pipe, anchor: anchor), notice: 'Tobacco pipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tobacco_pipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tobacco_pipes/1
  # DELETE /tobacco_pipes/1.json
  def destroy
    @tobacco_pipe = TobaccoPipe.find(params[:id])
    activity = Activity.create(:user => current_user, :controller => params[:controller], :action => params[:action], :object_id => @tobacco_pipe.id, :activity => "Deleted #{@tobacco_pipe.ArtifactID}")
    @tobacco_pipe.destroy

    respond_to do |format|
      format.js { render :text => 'success'}
      format.html { redirect_to tobacco_pipes_url }
      format.json { head :no_content }
    end
  end
  
  def duplicate
    orig = TobaccoPipe.find(params[:id])
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
    @tobacco_pipe = TobaccoPipe.new
    @tobacco_pipe.EditorIDN = current_user.editor_id
    @tobacco_pipe.generate_context_artifact = gca
    # @tobacco_pipe.generate_context_artifact.save
    @tobacco_pipe.GenerateContextArtifactID = @tobacco_pipe.generate_context_artifact.id
    @tobacco_pipe.EditorIDN = current_user.editor_id
    @tobacco_pipe.Quantity = orig.Quantity
    @tobacco_pipe.TobaccoPipeCompletenessID = orig.TobaccoPipeCompletenessID
    @tobacco_pipe.TobaccoPipeMaterialID = orig.TobaccoPipeMaterialID
    @tobacco_pipe.TobaccoPipeManuTechID = orig.TobaccoPipeManuTechID
    @tobacco_pipe.PasteMunAppColorID = orig.PasteMunAppColorID
    @tobacco_pipe.PasteInclusionID = orig.PasteInclusionID
    @tobacco_pipe.DecorationYN = orig.DecorationYN
    @tobacco_pipe.TextMarkYN = orig.TextMarkYN
    @tobacco_pipe.GlazeTypeID = orig.GlazeTypeID
    @tobacco_pipe.GlazeMunAppColorID = orig.GlazeMunAppColorID
    @tobacco_pipe.Notes = orig.Notes
    @tobacco_pipe.BowlFormID = orig.BowlFormID
    @tobacco_pipe.BowlBaseTypeID = orig.BowlBaseTypeID
    @tobacco_pipe.MouthpieceFormID = orig.MouthpieceFormID
    @tobacco_pipe.PMM = orig.PMM
    @tobacco_pipe.Conservation = orig.Conservation
    
    
    @tobacco_pipe.ArtifactID = ' - '
    # @ceramic.save
    # if @tobacco_pipe.project != nil
    #   @institution_id = @tobacco_pipe.project.InstitutionID
    #   @images = Image.where(:InstitutionID => @tobacco_pipe.project.InstitutionID).limit(100).order('"DateAdded" desc')
    # else
    #   @images = Image.limit(100).order('"DateAdded" desc')
    # end
    @in_context = []
    if orig.context_sample != nil
      image_subtypes = ImageSubtype.where(:ImageSubtype => 'Tobacco Pipes').map {|i| i.ImageSubtypeID}
      @images = Image.joins(:projects).where('"ImageSubtypeID" in (?) and "tblProject"."ProjectID" = ?', image_subtypes, @tobacco_pipe.context_sample.project.ProjectID).limit(100).order('"DateAdded" desc')
      @project_id = @tobacco_pipe.context_sample.project.ProjectID
      @image_subtype = 'Tobacco Pipes'
      @in_context = TobaccoPipe.joins(:context_sample).where("\"tblContextSample\".\"ContextSampleID\" = '#{orig.context_sample.ContextSampleID}'").order('"ArtifactID"')
    end
    render action: 'edit'
  end
  
  def artifact_ids
    @glasses = Glass.select('"ArtifactID"','"GenerateContextArtifactID"').where(['"ArtifactID" ilike ?',"%#{params[:q]}%"]).limit(10).order('"ArtifactID"')
    respond_to do |format|
      format.json { render json: @glasses }
    end    
  end
  
  def images
    image_subtypes = ImageSubtype.where(:ImageSubtype => params['image_subtype']).map {|i| i.ImageSubtypeID}
    @images = Image.includes(:image_type).joins(:projects).where("(\"ImageFileLocation\" ilike ? or \"ImageDescription\" ilike ? or \"Institution\" ilike ? or \"CatalogueNumber\" ilike ? or \"tblImageType\".\"ImageType\" ilike ?) and (\"ImageSubtypeID\" in (?) and \"tblProject\".\"ProjectID\" = ?)","%#{params[:query]}%", "%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%","%#{params[:query]}%", image_subtypes, params[:project_id]).references(:image_type).limit(100).order('"tblImage"."DateAdded" desc')
    @project_id = params[:project_id]
    @image_type = params[:image_type]
    @image_subtype = params[:image_subtype]
    respond_to do |format|
      format.js {render 'partials/images'}
    end    
  end
  
  
  private
  
  def tobacco_pipe_params
    # debugger
    params.require(:tobacco_pipe).permit(:GenerateContextArtifactID, :Quantity, :TobaccoPipeCompletenessID, :TobaccoPipeMaterialID, :TobaccoPipeManuTechID, :MunSedColorID, :PasteInclusionID, :DecorationYN, :TextMarkYN, :Mended, :MendedYNID, :GlazeTypeID, :TobPipeBasicColorID, :Notes, :StemLength, :ExteriorStemDiameter, :MetricBoreDiameter, :BoreDiameter64ths, :BowlHeight, :MaximumBowlDiameter, :BowlRimDiameter, :BowlVolume, :MaximumSherdMeasurement, :Weight, :BowlFormID, :BowlBaseTypeID, :MouthpieceFormID, :CompleteMarkDescription, :PipeMaker, :ProductionDates, :ManufactureLocation, :PMM, :Conservation, :GlazeMunAppColorID, :PasteMunAppColorID,  tobacco_pipe_decorations_attributes: [:id, :_destroy, :TobaccoPipeDecMotifID, :TobaccoPipeMotifManuTechID, :MotifTextLocationID, :Notes], tobacco_pipe_text_marks_attributes: [:id, :_destroy, :TextMarkTypeID, :MotifTextLocationID, :PipeTextFrameMotifID, :FirstName, :LastName, :PlaceName, :SloganOther, :MarkNotes], :gen_object_artifacts_attributes => [:id, :_destroy, :ObjectID, :ArtifactID], artifact_images_attributes: [:id, :_destroy, :ImageID, :ArtifactID])
  end
  
end
