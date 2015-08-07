class HomepageController < ApplicationController
  require_dependency 'queries'
  include Queries
  
  layout 'homepage'

  after_action :allow_daacs_iframe

  
  # GET /homepage
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @acdistances }
    end
  end

  # GET /acdistances/1
  # GET /acdistances/1.json
  def show
    @acdistance = Acdistance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @acdistance }
    end
  end

  # GET /acdistances/new
  # GET /acdistances/new.json
  def new
    @acdistance = Acdistance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @acdistance }
    end
  end

  # GET /acdistances/1/edit
  def edit
    @acdistance = Acdistance.find(params[:id])
  end

  # POST /acdistances
  # POST /acdistances.json
  def create
    @acdistance = Acdistance.new(params[:acdistance])

    respond_to do |format|
      if @acdistance.save
        format.html { redirect_to @acdistance, notice: 'Acdistance was successfully created.' }
        format.json { render json: @acdistance, status: :created, location: @acdistance }
      else
        format.html { render action: "new" }
        format.json { render json: @acdistance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /acdistances/1
  # PUT /acdistances/1.json
  def update
    @acdistance = Acdistance.find(params[:id])

    respond_to do |format|
      if @acdistance.update_attributes(params[:acdistance])
        format.html { redirect_to @acdistance, notice: 'Acdistance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @acdistance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acdistances/1
  # DELETE /acdistances/1.json
  def destroy
    @acdistance = Acdistance.find(params[:id])
    @acdistance.destroy

    respond_to do |format|
      format.html { redirect_to acdistances_url }
      format.json { head :no_content }
    end
  end
  
  def dashboard
    @page_title = 'Dashboard'
    range = Time.now - 365.days
    @gen_artifacts = Activity.where("controller = 'gen_artifacts' and created_at > ?", range)
    @ceramics = Activity.where("controller = 'ceramics' and created_at > ?", range)
    @glasses = Activity.where("controller = 'glasses' and created_at > ?", range)
    @beads = Activity.where("controller = 'beads' and created_at > ?", range)
    @buckles = Activity.where("controller = 'buckles' and created_at > ?", range)
    @bones = Activity.where("controller = 'bones' and created_at > ?", range)
    @tobacco_pipes = Activity.where("controller = 'tobacco_pipes' and created_at > ?", range)
    @utensils = Activity.where("controller = 'utensils' and created_at > ?", range)
    @buttons = Activity.where("controller = 'buttons' and created_at > ?", range)
    @contexts = Activity.where("controller = 'contexts' and created_at > ?", range)
    @features = Activity.where("controller = 'context_features' and created_at > ?", range)
    
    respond_to do |format|
      format.html { render :layout => 'application'}
      format.json { render json: @acdistances }
    end
  end

  def about
    @page_title = 'About'

    respond_to do |format|
      format.html
      format.json { render json: @acdistances }
    end
  end
  
  def test
    render :layout => 'application'
  end

  def readings
    @page_title = 'Readings'
    render :layout => 'application'
  end

  def project_team
    @page_title = 'Project Team'
  end

  def partners
    @page_title = 'Partners'
  end

  def sponsors
    @page_title = 'Sponsors'
  end

  def research
    @page_title = 'Research'
  end

  def sqlqueries
    render :layout => 'application'
  end

  def query
    @page_title = 'Queries'
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end

  def artifact_query_one
    @page_title = 'AQ1'
    render :layout => 'application'
  end
  def artifact_query_two
    @page_title = 'AQ2'
    render :layout => 'application'
  end
  def artifact_query_three
    @page_title = 'AQ3'
    render :layout => 'application'
  end
  def artifact_query_four
    render :layout => 'application'
  end
  def artifact_query_five
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end

  def context_query_one
    @page_title = 'CQ1'
    render :layout => 'application'
  end

  def faunal_query_one
    render :layout => 'application'
  end

  def faunal_query_two
    render :layout => 'application'
  end
  
  def aq_one
    @page_title = 'AQ1'
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end

  def aq_two
    @page_title = 'AQ2'
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end

  def aq_three
    @page_title = 'AQ3'
    @bead_items = [ "Completeness", "Material", "ManufacturingTechnique",  "Structure", "Form", "Shape", "EndTreatment", "Heat Treated", "BeadColor", "DAACS Color Description", "Bead Munsell Color Range", "NumberofFacets", "BeadDecoration", "CasingInformation", "Diaphaneity", "PostManufacturingModification", "Patination", "Burned", "WeatheredEroded", "Length", "Width", "Height", "Weight", "SizeofPerforationI", "SizeofPerforationII", "Mended","Conservation","Notes", "Images", "ObjectID"]
    @buckle_items = ["BuckleType", "Completeness", "FramePlating", "BucklePart,Material,ManufacturingTechnique,Shape,Element,Length,Width", "BuckleDecoration","Marks", "Burned","Conservation", "Mended", "PostManufacturingModification","Notes", "Images", "ObjectID"]
    @button_items = ["Completeness", "Material", "ManufacturingTechnique", "ButtonType", "ButtonShape", "NonMetalButtonColor", "MetalButtonColor", "ButtonEye", "ShankMaterial", "ShankStyle", "ShankCondition", "2PieceButton:FaceMaterial", "2PieceButton:FaceManufacturingTechnique", "2PieceButton:JoinMethod", "Decoration?", "ButtonDecoration","Length", "Width", "Diameter", "Height", "Weight", "Post-Manufacturing Modification", "Burned", "Conservation", "Back Stamp", "Notes", "Images", "ObjectID"]
    @ceramic_items = ["Material", "ManufacturingTechnique", "Ware", "VesselCategory", "Form", "Mended?", "MendedForm", "Completeness", "ExteriorGlazeType", "ExteriorColor", "ExteriorGlazeOpacity", "InteriorGlazeType", "InteriorColor", "InteriorGlazeOpacity", "DecorativeTechnique/StylisticElements", "PatternName", "PatternReference", "Burned", "PostManufacturingModification", "Wear Location, Ceramic Completeness, Wear Pattern", "BaseMark", "BaseMarkColor", "BaseMarkReference", "PasteColor", "OxidizedVsReduced", "CoarseEarthenwareType", "CoarseEarthenwareDecorativeMode", "ColonowareRimForm", "ColonowareRimAngle", "MaximumRimWidth", "CoarseEarthenwareBaseForm", "CoarseEarthenwareFootringForm", "CoarseEarthenwarePasteInclusionDensity", "PasteInclusions", "ColonoSherdCompletenessThickness", "SherdThickness","MaximumSherdMeasurement", "SherdWeight","MendedSherdWeight","RimLength","RimDiameter",
"MendedRimDiameter","MaxRimWidth","BaseLength", "BaseDiameter", "MendedBaseDiameter", "Notes", "Images", "ArtifactsMendedTo", "ObjectID"]
  @glass_items = ["Material", "Color", "VesselCategory", "Form", "Completeness", "ManufacturingTechnique", "MoldType", "BottleInformation", "Decoration", "DecorationInformation", "MarkInformation", "PostManufacturingModification", "Mended", "PontilMark", "TotalContainerHeight", "StemwareBodyShape", "StemwareFootShape", "StemShape", "StemLength", "Burned", "Patination", "Solarized", "SherdSize", "SherdThickness", "SherdWeight", "MendedSherdWeight", "LengthofRim", "RimDiameter", "MendedRimDiameter", "BaseDiameter", "BaseLength", "MendedBaseDiameter", "Conservation", "Images", "ArtifactsMendedTo", "ObjectID","Notes"]
  @gen_artifact_items = ["Category", "Form", "Completeness", "MaterialandManufacturingTechnique", "NailHeadType", "DecorationYN?", "DecorationType,Color,andNotes", "NailEndType", "NailModification", "NailLength", "CoinDate", "BrickSize", "Mended", "PostManufacturingModification", "Burned", "Length",  "Width", "Height", "Weight", "Marks", "Notes", "Conservation", "Images","ObjectID"]
  @bone_items = ["Reliability", "TaxonEnglish", "TaxonLatin", "TaxonOrder", "TaxonCategory", "TaxonGroupCategory", "BodyPart", "Element", "Symmetry", "NISP", "BoneWeight", "BoneLocation", "BoneDescriptor", "BoneSize", "Fusion", "SexExpand", "ChewType", "ChewLocation", "FreshBreak", "ToothType", "ToothWear", "DiseaseTrauma", "Weathered?", "Burned?", "BoneCondition", "NumberCutMarks", "ButcherMethod", "ButcherLocation", "ButcherDirection", "CutType", "CutLocation", "CutDirection", "Meat WeightAdult", "Meat Weight mmature", "Notes", "Identifier", "DateIdentified", "MeasurementAccuracy"]
  @tobacco_pipe_items = ["Completeness", "Material", "PasteColor", "PasteInclusion", "ManuTech", "Glaze", "GlazeColor", "Decoration?", "Decoration", "TextMark?", "TextMark", "PipeMaker", "ProductionDates", "ManufactureLocation", "CompleteMarkDescription", "Post ManufacturingModification", "BowlForm", "BaseType", "MouthpieceForm", "MaximumSherdMeasurement", "StemLength", "ExteriorStemDiameter", "BoreDiameter64ths", "MetricBoreDiameter", "BowlHeight", "BowlVolume", "MaximumBowlDiameter", "BowlRimDiameter", "Weight", "Conservation", "Images", "ObjectID", "Notes"]
  @utensil_items  = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber", "FeatureGroup", "FeatureGroupInterpretation", "StratigraphicGroup", "DAACSPhase", "ArtifactID", "Count", "Completeness", "UtensilForm", "ForkTineCount", "PresenceofRatTail", "UtensilSpecifics", "Decoration", "Marks", "UtensilPlating", "HandleDecoration", "ArtifactLength", "ArtifactWidth", "ArtifactWeight", "Burned", "PostManufacturingModification", "Conservation", "Mended", "Images", "ObjectID",
"Notes"]
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end

  def query_objects
    @page_title = 'OQ1'
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end

  def query_objects_two
    @page_title = 'OQ2'
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end

  def query_objects_three
    @page_title = 'OQ3'
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end

  def query_context_one
    @page_title = 'CQ1'
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end

  def query_context_two
    # @attributes = ["LevelType", "MaximumLithostratigraphicThickness", "ActualMeasuredVolume(liters)", "ContextLength", "ContextWidth", "QuadratLength", "QuadratWidth", "STPNorthing", "STPEasting", "ArtifactPresence", "ContextTPQ", "TPQNotes", "DateOpened", "DateClosed", "ExcavatedBy", "RecordedBy", "ExcavatorSedimentDescription", "ExcavatorInterpretation", "DataEntryNotes", "LevelDesignation", "FSNumber", "MasterContextNumber", "MasterContextInterpretation", "ExcavatorPhase", "DAACSStratigraphicGroup", "DAACSStratigraphicGroupInterpretation", "DAACSPhase", "CAPlowzonePhase", "Photograph", "PlanDrawings", "ProfileDrawings"]
    @page_title = 'CQ2'
    @attributes = ["LevelType", "MaximumLithostratigraphicThickness", "ActualMeasuredVolume(liters)", "ContextLength", "ContextWidth", "QuadratLength", "QuadratWidth", "ArtifactPresence", "ContextTPQ", "TPQNotes", "DateOpened", "DateClosed", "ExcavatedBy", "RecordedBy", "ExcavatorSedimentDescription", "ExcavatorInterpretation", "DataEntryNotes", "LevelDesignation", "FSNumber", "MasterContextNumber", "MasterContextInterpretation", "ExcavatorPhase", "DAACSStratigraphicGroup", "DAACSStratigraphicGroupInterpretation", "DAACSPhase", "CAPlowzonePhase", "Photograph", "PlanDrawings", "ProfileDrawings"]
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end

  def query_sites
    @page_title = 'SQ'
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end

  def mcd_one
    @page_title = 'MCD1'
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end

  def mcd_two
    @page_title = 'MCD2'
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end

  def query_faunal_two
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end

  def query_one_image
    @page_title = 'IQ1'
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end
  
  def query_two_image
    @page_title = 'IQ2'
    render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')
  end

  def search_one
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = params['sites'].map {|p| "\"ProjectID\" = '#{p}'" }.join(" OR ")
    end
    if params['daacs'] != nil and params['daacs'] != ''
      query = query != '' ? "#{query} and \"Published\" = 1" : "\"Published\" = 1"
    end
    # @beads = QueryOneBead.find_by_sql('select "ProjectName", "ArtifactType", \'Bead\' as "Category", sum("Quantity") as "Quantity" from query_one_beads where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    # @buckles = QueryOneBuckle.find_by_sql('select "ProjectName", "ArtifactType", \'Buckle\' as "Category", sum("Quantity") as "Quantity" from query_one_buckles where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    # @buttons = QueryOneButton.find_by_sql('select "ProjectName", "ArtifactType", \'Button\' as "Category", sum("Quantity") as "Quantity" from query_one_buttons where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    # @ceramics = QueryOneCeramic.find_by_sql('select "ProjectName", "ArtifactType", \'Ceramic\' as "Category", sum("Quantity") as "Quantity" from query_one_ceramics where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    # @gen_artifacts = QueryOneGenArtifact.find_by_sql('select "ProjectName", "ArtifactType", \'All Other Artifacts\' as "Category", sum("Quantity") as "Quantity" from query_one_gen_artifacts where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    # @glasses = QueryOneGlass.find_by_sql('select "ProjectName", "ArtifactType", \'Glass\' as "Category", sum("Quantity") as "Quantity" from query_one_glasses where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    # @utensils = QueryOneUtensil.find_by_sql('select "ProjectName", "ArtifactType", \'Utensil\' as "Category", sum("Quantity") as "Quantity" from query_one_utensils where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    # @pipes = QueryOneTobaccoPipe.find_by_sql('select "ProjectName", "ArtifactType", \'Tobacco Pipe\' as "Category", sum("Quantity") as "Quantity" from query_one_tobacco_pipes where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    # @bones = QueryOneBone.find_by_sql('select "ProjectName", \'\' as "ArtifactType", \'Faunal\' as "Category", sum("Quantity") as "Quantity" from query_one_bones where '+query+' group by "ProjectName" order by "ProjectName"')
    @beads = AqOneBead.where(query)
    @buckles = AqOneBuckle.where(query)
    @buttons = AqOneButton.where(query)
    @bones = AqOneBone.where(query)
    @ceramics = AqOneCeramic.where(query)
    @glasses = AqOneGlass.where(query)
    @utensils = AqOneUtensil.where(query)
    @pipes = AqOneTobaccoPipe.where(query)
    @gen_artifacts = AqOneGenArtifact.where(query)
    
    @artifacts = @beads + @buckles + @buttons + @ceramics + @glasses + @bones + @gen_artifacts + @utensils + @pipes 
    @total = @artifacts.size 
    if params[:all] == nil
      @artifacts = Kaminari.paginate_array(@artifacts).page(@page).per(@per_page)
    end
      
    respond_to do |format|
      format.html {render :layout => 'application'}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end

  def aq_two_results
    @page_title = 'AQ2'
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = "(#{params['sites'].map {|p| "\"a\".\"ProjectID\" = '#{p}'" }.join(" OR ")})"
    end
    if params['daacs'] != nil and params['daacs'] != ''
      query = query != '' ? "#{query} and \"a\".\"Published\" = 1" : "\"a\".\"Published\" = 1"
    end
    @display_fields = []
    @category = ''
    @category_values = ''
    if params['context_selected'] != nil and params['context_selected'].strip != ''
      @category = 'Context'
      @category_values = params['context']
      query2 = params['context'].split("\r\n").map {|p| "\"Context\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
      query = "where #{query}" if query != ''
      # byebug
      query_str = aq_two_context(query)

      @artifacts = AqTwoContext.find_by_sql(query_str)
      total = AqTwoContext.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query_str}) n")
      if total.size > 0
        @artifact_total = total.first.Quantity
      else
        @artifact_total = 0
      end
      @display_fields = ["ProjectName","ProjectID","Context", "DepositType", "UnitType", "FeatureType", "FeatureNumber",  "FeatureGroup", "FeatureGroupInterpretation", "DAACSStratigraphicGroup", "DAACSStratigraphicGroupInterpretation", "DAACSPhase", "ArtifactID", "Quantity", "Form", "Material", "ManufacturingTechnique", "VesselCategory", "CeramicDecTechAppliedColorCombination", "CeramicGenre", "ArtifactType"]
      
    # end
  elsif params['feature_number_selected'] != nil and params['feature_number_selected'].strip != ''
      @category = 'Feature Number'
      @category_values = params['feature_number']
      query2 = params['feature_number'].split("\r\n").map {|p| "e.\"FeatureNumber\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
      query = "where #{query}" if query != ''
      
      query_str = aq_two_feature_number(query)
      
      @artifacts = AqTwoFeatureNumber.find_by_sql(query_str)
      total = AqTwoFeatureNumber.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query_str}) n")
      if total.size > 0
        @artifact_total = total.first.Quantity
      else
        @artifact_total = 0
      end
      @display_fields = ["ProjectName","ProjectID", "FeatureType", "FeatureNumber", "FeatureGroupNumber", "DAACSStratigraphicGroup", "DAACSStratigraphicGroupInterpretation", "DAACSPhase", "ArtifactID", "Quantity", "Form", "Material", "ManufacturingTechnique", "VesselCategory", "CeramicDecTechAppliedColorCombination", "CeramicGenre", "ArtifactType"]
    # end
  elsif params['phase_selected'] != nil and params['phase_selected'] != ''
      @category = 'Phase'
      @category_values = params['phase']
      
      query2 = params['phase'].split("\r\n").map {|p| "\"DAACSPhase\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
      query = "where #{query}" if query != ''
      query = aq_two_phase(query)
      
  @artifacts = AqTwoPhase.find_by_sql(query)
  total = AqTwoPhase.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
  if total.size > 0
    @artifact_total = total.first.Quantity
  else
    @artifact_total = 0
  end
      
      @display_fields = ["ProjectName", "ProjectID", "DAACSPhase", "ArtifactID", "Quantity", "Form", "Material", "ManufacturingTechnique", "VesselCategory", "CeramicDecTechAppliedColorCombination", "CeramicGenre", "ArtifactType"]
      
    # end
  elsif params['strat_group_selected'] != nil and params['strat_group_selected'].strip != ''
      @category = 'Stratiographic Group'
      @category_values = params['strat_group']
      query2 = params['strat_group'].split("\r\n").map {|p| "\"DAACSStratigraphicGroup\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
      query = "where #{query}" if query != ''
      query_str= aq_two_strat_group(query)

      @artifacts = AqTwoStratGroup.find_by_sql(query_str)
      total = AqTwoStratGroup.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query_str}) n")
      if total.size > 0
        @artifact_total = total.first.Quantity
      else
        @artifact_total = 0
      end
      
      @display_fields = ["ProjectName", "ProjectID", "DAACSStratigraphicGroup", "DAACSStratigraphicGroupInterpretation", "DAACSPhase", "ArtifactID", "Quantity", "Form", "Material", "ManufacturingTechnique", "VesselCategory", "CeramicDecTechAppliedColorCombination", "CeramicGenre", "ArtifactType"]
      
    # end
  elsif params['feature_group_selected'] != nil and params['feature_group_selected'].strip != ''
      @category = 'Feature Group'
      @category_values = params['feature_group']
      query2 = params['feature_group'].split("\r\n").map {|p| "e.\"FeatureGroup\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
      query = "where #{query}" if query != ''
      query = aq_two_feature_group(query)

      @artifacts = AqTwoFeatureGroup.find_by_sql(query)
      total = AqTwoFeatureGroup.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
      if total.size > 0
        @artifact_total = total.first.Quantity
      else
        @artifact_total = 0
      end
      
      @display_fields = ["ProjectName", "ProjectID", "FeatureType", "FeatureNumber", "FeatureGroupNumber", "DAACSStratigraphicGroup", "DAACSStratigraphicGroupInterpretation", "DAACSPhase", "ArtifactID", "Quantity", "Form", "Material", "ManufacturingTechnique", "VesselCategory", "CeramicDecTechAppliedColorCombination", "CeramicGenre", "ArtifactType"]
      
    # end
  elsif params['feature_types_selected'] != nil and params['feature_types_selected'] != ''
      @category = 'Feature Type'
      @category_values = params['feature_types'] != nil ? params['feature_types'].join(', ') : ''
      query2 = ''
      query2 = params['feature_types'].map {|p| "\"FeatureType\" = '#{p.gsub("'","''")}'" }.join(" OR ") if params['feature_types'] != nil
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
      query = "where #{query}" if query != ''
      query = aq_two_feature_type(query)

      @artifacts = AqTwoFeatureType.find_by_sql(query)
      total = AqTwoFeatureType.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
      if total.size > 0
        @artifact_total = total.first.Quantity
      else
        @artifact_total = 0
      end
      
      @display_fields = ["ProjectName", "ProjectID", "FeatureType", "FeatureNumber", "FeatureGroupNumber", "DAACSStratigraphicGroup", "DAACSStratigraphicGroupInterpretation", "DAACSPhase", "ArtifactID", "Quantity", "Form", "Material", "ManufacturingTechnique", "VesselCategory", "CeramicDecTechAppliedColorCombination", "CeramicGenre", "ArtifactType"]
    # end
  elsif params['quadrat'] != nil and params['quadrat'].strip != ''
      @category = 'Quadrat ID'
      @category_values = params['quadrat']
      query2 = params['quadrat'].split("\r\n").map {|p| "\"QuadratID\" = '#{p}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
      @beads = AqOneQuadratBead.where(query)
      @buckles = AqOneQuadratBuckle.where(query)
      @buttons = AqOneQuadratButton.where(query)
      @bones = AqOneQuadratBone.where(query)
      @ceramics = AqOneQuadratCeramic.where(query)
      @glasses = AqOneQuadratGlass.where(query)
      @utensils = AqOneQuadratUtensil.where(query)
      @pipes = AqOneQuadratTobaccoPipe.where(query)
      @gen_artifacts = AqOneQuadratGenArtifact.where(query)
      @display_fields = ["ProjectName", "ProjectID", "QuadratID", "TotalCount", "Form", "ManufacturingTechnique", "Material", "VesselCategory", "CeramicDecTechAppliedColorCombination", "CeramicGenre", "ArtifactType"]
    # end
  elsif params['unit_types_selected'] != nil and params['unit_types_selected'].strip != ''
    @category = 'Unit Type'
    @category_values = params['unit_types'] != nil ? params['unit_types'].join(', ') : ''
    query2 = ''
    query2 = params['unit_types'].map {|p| "\"UnitType\" = '#{p.gsub("'","''")}'" }.join(" OR ") if params['unit_types'] != nil
    query = query != '' ? "(#{query})" : query
    query = "#{query} and (#{query2})" if query2 != ''
    query = "where #{query}" if query != ''
    query = aq_two_unit_type(query)

    @artifacts = AqTwoUnitType.find_by_sql(query)
    total = AqTwoUnitType.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
    if total.size > 0
      @artifact_total = total.first.Quantity
    else
      @artifact_total = 0
    end
    @display_fields = ["ProjectName", "ProjectID", "Context", "DepositType", "UnitType", "FeatureType", "FeatureNumber", "FeatureGroup", "FeatureGroupInterpretation", "DAACSStratigraphicGroup", "DAACSStratigraphicGroupInterpretation", "DAACSPhase", "ArtifactID", "Quantity", "Form", "Material", "ManufacturingTechnique", "VesselCategory", "CeramicDecTechAppliedColorCombination", "CeramicGenre", "ArtifactType"]
  else
      @category = 'Sites'
      @category_values = ''
      query = "where #{query}" if query != ''
      query = aq_two_site(query)
      
      @artifacts = AqTwoSite.find_by_sql(query)
      total = AqTwoSite.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
      if total.size > 0
        @artifact_total = total.first.Quantity
      else
        @artifact_total = 0
      end
      
      @display_fields = ["ProjectName", "ProjectID", "Context", "DepositType", "UnitType", "FeatureType", "FeatureNumber", "FeatureGroup", "FeatureGroupInterpretation", "DAACSStratigraphicGroup", "DAACSStratigraphicGroupInterpretation", "DAACSPhase", "ArtifactID", "Quantity", "Form", "Material", "ManufacturingTechnique", "VesselCategory", "CeramicDecTechAppliedColorCombination", "CeramicGenre", "ArtifactType"]
    
    end
    

    @total = @artifacts.size
    if params[:all] == nil
      @artifacts = Kaminari.paginate_array(@artifacts).page(@page).per(@per_page)
    end
      
    respond_to do |format|
      format.html {render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end

  def aq_one_results
    @page_title = 'AQ1'
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = "(#{params['sites'].map {|p| "\"a\".\"ProjectID\" = '#{p}'" }.join(" OR ")})"
    end
    if params['daacs'] != nil and params['daacs'] != ''
      query = query != '' ? "#{query} and \"a\".\"Published\" = 1" : "\"a\".\"Published\" = 1"
    end
    @display_fields = []
    @category = ''
    @category_values = ''
    if params['context_selected'] != nil and params['context_selected'].strip != ''
      @category = 'Context'
      @category_values = params['context']
      if params['context'].to_s != '' and params['context'].to_s != '*'
        query2 = params['context'].split("\r\n").map {|p| "\"Context\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
        query = query != '' ? "(#{query})" : query
        query = "#{query} and (#{query2})" if query2 != ''
      end
      query = "where #{query}" if query != ''
      # byebug
      query_str = aq_one_context(query)

@artifacts = AqOneContextBead.find_by_sql(query_str)
total = AqOneContextBead.find_by_sql("select sum(\"TotalCount\") as \"TotalCount\" from (#{query_str}) n")
if total.size > 0
  @artifact_total = total.first.TotalCount
else
  @artifact_total = 0
end

      # @beads = AqOneContextBead.where(query)
      # @buckles = AqOneContextBuckle.where(query)
      # @buttons = AqOneContextButton.where(query)
      # @bones = AqOneContextBone.where(query)
      # @ceramics = AqOneContextCeramic.where(query)
      # @glasses = AqOneContextGlass.where(query)
      # @utensils = AqOneContextUtensil.where(query)
      # @pipes = AqOneContextTobaccoPipe.where(query)
      # @gen_artifacts = AqOneContextGenArtifact.where(query)
      # @artifact_total = AqOneContextBead.where(query).sum("TotalCount")
      # @artifact_total += AqOneContextBuckle.where(query).sum("TotalCount")
      # @artifact_total += AqOneContextButton.where(query).sum("TotalCount")
      # @artifact_total += AqOneContextBone.where(query).sum("TotalCount")
      # @artifact_total += AqOneContextCeramic.where(query).sum("TotalCount")
      # @artifact_total += AqOneContextGlass.where(query).sum("TotalCount")
      # @artifact_total += AqOneContextUtensil.where(query).sum("TotalCount")
      # @artifact_total += AqOneContextTobaccoPipe.where(query).sum("TotalCount")
      # @artifact_total += AqOneContextGenArtifact.where(query).sum("TotalCount")
      @display_fields = ["ProjectName","ProjectID","Context", "DepositType", "UnitType", "FeatureType", "FeatureNumber",  "FeatureGroup", "FeatureGroupInterpretation", "DAACSStratigraphicGroup", "DAACSStratigraphicGroupInterpretation", "DAACSPhase", "TotalCount", "ArtifactType", "ArtifactCategory"]
      
    # end
  elsif params['feature_number_selected'] != nil and params['feature_number_selected'].strip != ''
      @category = 'Feature Number'
      @category_values = params['feature_number']
      if params['feature_number'].to_s != '' and params['feature_number'].to_s != '*'
      
        query2 = params['feature_number'].split("\r\n").map {|p| "e.\"FeatureNumber\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
        query = query != '' ? "(#{query})" : query
        query = "#{query} and (#{query2})" if query2 != ''
      end
      query = "where #{query}" if query != ''
      
      query_str = aq_one_feature_number(query)
      
      @artifacts = AqOneFnBead.find_by_sql(query_str)
      total = AqOneFnBead.find_by_sql("select sum(\"TotalCount\") as \"TotalCount\" from (#{query_str}) n")
      if total.size > 0
        @artifact_total = total.first.TotalCount
      else
        @artifact_total = 0
      end
      #
      # @beads = AqOneFnBead.where(query)
      # @buckles = AqOneFnBuckle.where(query)
      # @buttons = AqOneFnButton.where(query)
      # @bones = AqOneFnBone.where(query)
      # @ceramics = AqOneFnCeramic.where(query)
      # @glasses = AqOneFnGlass.where(query)
      # @utensils = AqOneFnUtensil.where(query)
      # @pipes = AqOneFnTobaccoPipe.where(query)
      # @gen_artifacts = AqOneFnGenArtifact.where(query)
      # @artifact_total = AqOneFnBead.where(query).sum("TotalCount")
      # @artifact_total += AqOneFnBuckle.where(query).sum("TotalCount")
      # @artifact_total += AqOneFnButton.where(query).sum("TotalCount")
      # @artifact_total += AqOneFnBone.where(query).sum("TotalCount")
      # @artifact_total += AqOneFnCeramic.where(query).sum("TotalCount")
      # @artifact_total += AqOneFnGlass.where(query).sum("TotalCount")
      # @artifact_total += AqOneFnUtensil.where(query).sum("TotalCount")
      # @artifact_total += AqOneFnTobaccoPipe.where(query).sum("TotalCount")
      # @artifact_total += AqOneFnGenArtifact.where(query).sum("TotalCount")
      @display_fields = ["ProjectName","ProjectID", "FeatureNumber", "FeatureType", "FeatureGroup", "FeatureGroupInterpretation", "TotalCount", "ArtifactType", "ArtifactCategory"]
    # end
  elsif params['phase_selected'] != nil and params['phase_selected'] != ''
      @category = 'Phase'
      @category_values = params['phase']
      
      if params['phase'].to_s != '' and params['phase'].to_s != '*'
        query2 = params['phase'].split("\r\n").map {|p| "\"DAACSPhase\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
        query = query != '' ? "(#{query})" : query
        query = "#{query} and (#{query2})" if query2 != ''
      end
      query = "where #{query}" if query != ''
      query = aq_one_phase(query)
      
  @artifacts = AqOnePhaseBead.find_by_sql(query)
  total = AqOnePhaseBead.find_by_sql("select sum(\"TotalCount\") as \"TotalCount\" from (#{query}) n")
  if total.size > 0
    @artifact_total = total.first.TotalCount
  else
    @artifact_total = 0
  end
      # @beads = AqOnePhaseBead.where(query)
      # @buckles = AqOnePhaseBuckle.where(query)
      # @buttons = AqOnePhaseButton.where(query)
      # @bones = AqOnePhaseBone.where(query)
      # @ceramics = AqOnePhaseCeramic.where(query)
      # @glasses = AqOnePhaseGlass.where(query)
      # @utensils = AqOnePhaseUtensil.where(query)
      # @pipes = AqOnePhaseTobaccoPipe.where(query)
      # @gen_artifacts = AqOnePhaseGenArtifact.where(query)
      # @artifact_total = AqOnePhaseBead.where(query).sum("TotalCount")
      # @artifact_total += AqOnePhaseBuckle.where(query).sum("TotalCount")
      # @artifact_total += AqOnePhaseButton.where(query).sum("TotalCount")
      # @artifact_total += AqOnePhaseBone.where(query).sum("TotalCount")
      # @artifact_total += AqOnePhaseCeramic.where(query).sum("TotalCount")
      # @artifact_total += AqOnePhaseGlass.where(query).sum("TotalCount")
      # @artifact_total += AqOnePhaseUtensil.where(query).sum("TotalCount")
      # @artifact_total += AqOnePhaseTobaccoPipe.where(query).sum("TotalCount")
      # @artifact_total += AqOnePhaseGenArtifact.where(query).sum("TotalCount")
      
      @display_fields = ["ProjectName", "ProjectID", "DAACSPhase", "TotalCount", "ArtifactType", "ArtifactCategory"]
      
    # end
  elsif params['strat_group_selected'] != nil and params['strat_group_selected'].strip != ''
      @category = 'Stratiographic Group'
      @category_values = params['strat_group']
      if params['strat_group'].to_s != '' and params['strat_group'].to_s != '*'
        query2 = params['strat_group'].split("\r\n").map {|p| "\"DAACSStratigraphicGroup\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
        query = query != '' ? "(#{query})" : query
        query = "#{query} and (#{query2})" if query2 != ''
      end
      query = "where #{query}" if query != ''
      query_str= aq_one_strat_group(query)

      @artifacts = AqOneSgBead.find_by_sql(query_str)
      total = AqOneSgBead.find_by_sql("select sum(\"TotalCount\") as \"TotalCount\" from (#{query_str}) n")
      if total.size > 0
        @artifact_total = total.first.TotalCount
      else
        @artifact_total = 0
      end
      
      # @beads = AqOneSgBead.where(query)
      # @buckles = AqOneSgBuckle.where(query)
      # @buttons = AqOneSgButton.where(query)
      # @bones = AqOneSgBone.where(query)
      # @ceramics = AqOneSgCeramic.where(query)
      # @glasses = AqOneSgGlass.where(query)
      # @utensils = AqOneSgUtensil.where(query)
      # @pipes = AqOneSgTobaccoPipe.where(query)
      # @gen_artifacts = AqOneSgGenArtifact.where(query)
      # @artifact_total = AqOneSgBead.where(query).sum("TotalCount")
      # @artifact_total += AqOneSgBuckle.where(query).sum("TotalCount")
      # @artifact_total += AqOneSgButton.where(query).sum("TotalCount")
      # @artifact_total += AqOneSgBone.where(query).sum("TotalCount")
      # @artifact_total += AqOneSgCeramic.where(query).sum("TotalCount")
      # @artifact_total += AqOneSgGlass.where(query).sum("TotalCount")
      # @artifact_total += AqOneSgUtensil.where(query).sum("TotalCount")
      # @artifact_total += AqOneSgTobaccoPipe.where(query).sum("TotalCount")
      # @artifact_total += AqOneSgGenArtifact.where(query).sum("TotalCount")
      
      @display_fields = ["ProjectName", "ProjectID", "DAACSStratigraphicGroup", "DAACSStratigraphicGroupInterpretation", "TotalCount", "ArtifactType", "ArtifactCategory"]
      
    # end
  elsif params['feature_group_selected'] != nil and params['feature_group_selected'].strip != ''
      @category = 'Feature Group'
      @category_values = params['feature_group']
      if params['feature_group'].to_s != '' and params['feature_group'].to_s != '*'
        query2 = params['feature_group'].split("\r\n").map {|p| "e.\"FeatureGroup\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
        query = query != '' ? "(#{query})" : query
        query = "#{query} and (#{query2})" if query2 != ''
      end
      query = "where #{query}" if query != ''
      query = aq_one_feature_group(query)

      @artifacts = AqOneFgBead.find_by_sql(query)
      total = AqOneFgBead.find_by_sql("select sum(\"TotalCount\") as \"TotalCount\" from (#{query}) n")
      if total.size > 0
        @artifact_total = total.first.TotalCount
      else
        @artifact_total = 0
      end
      
      # @beads = AqOneFgBead.where(query)
      # @buckles = AqOneFgBuckle.where(query)
      # @buttons = AqOneFgButton.where(query)
      # @bones = AqOneFgBone.where(query)
      # @ceramics = AqOneFgCeramic.where(query)
      # @glasses = AqOneFgGlass.where(query)
      # @utensils = AqOneFgUtensil.where(query)
      # @pipes = AqOneFgTobaccoPipe.where(query)
      # @gen_artifacts = AqOneFgGenArtifact.where(query)
      #
      # @artifact_total = AqOneFgBead.where(query).sum("TotalCount")
      # @artifact_total += AqOneFgBuckle.where(query).sum("TotalCount")
      # @artifact_total += AqOneFgButton.where(query).sum("TotalCount")
      # @artifact_total += AqOneFgBone.where(query).sum("TotalCount")
      # @artifact_total += AqOneFgCeramic.where(query).sum("TotalCount")
      # @artifact_total += AqOneFgGlass.where(query).sum("TotalCount")
      # @artifact_total += AqOneFgUtensil.where(query).sum("TotalCount")
      # @artifact_total += AqOneFgTobaccoPipe.where(query).sum("TotalCount")
      # @artifact_total += AqOneFgGenArtifact.where(query).sum("TotalCount")
      
      @display_fields = ["ProjectName", "ProjectID", "FeatureNumber", "FeatureType",  "FeatureGroup", "FeatureGroupInterpretation", "TotalCount", "ArtifactType", "ArtifactCategory"]
      
    # end
  elsif params['feature_types_selected'] != nil and params['feature_types_selected'] != ''
      @category = 'Feature Type'
      @category_values = params['feature_types'].join(', ')
      query2 = ''
      query2 = params['feature_types'].map {|p| "\"FeatureType\" = '#{p.gsub("'","''")}'" }.join(" OR ") if params['feature_types'] != nil
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
      query = "where #{query}" if query != ''
      query = aq_one_feature_type(query)

      @artifacts = AqOneFtBead.find_by_sql(query)
      total = AqOneFtBead.find_by_sql("select sum(\"TotalCount\") as \"TotalCount\" from (#{query}) n")
      if total.size > 0
        @artifact_total = total.first.TotalCount
      else
        @artifact_total = 0
      end
      
      # @beads = AqOneFtBead.where(query)
      # @buckles = AqOneFtBuckle.where(query)
      # @buttons = AqOneFtButton.where(query)
      # @bones = AqOneFtBone.where(query)
      # @ceramics = AqOneFtCeramic.where(query)
      # @glasses = AqOneFtGlass.where(query)
      # @utensils = AqOneFtUtensil.where(query)
      # @pipes = AqOneFtTobaccoPipe.where(query)
      # @gen_artifacts = AqOneFtGenArtifact.where(query)
      #
      # @artifact_total = AqOneFtBead.where(query).sum("TotalCount")
      # @artifact_total += AqOneFtBuckle.where(query).sum("TotalCount")
      # @artifact_total += AqOneFtButton.where(query).sum("TotalCount")
      # @artifact_total += AqOneFtBone.where(query).sum("TotalCount")
      # @artifact_total += AqOneFtCeramic.where(query).sum("TotalCount")
      # @artifact_total += AqOneFtGlass.where(query).sum("TotalCount")
      # @artifact_total += AqOneFtUtensil.where(query).sum("TotalCount")
      # @artifact_total += AqOneFtTobaccoPipe.where(query).sum("TotalCount")
      # @artifact_total += AqOneFtGenArtifact.where(query).sum("TotalCount")
      
      @display_fields = ["ProjectName", "ProjectID", "FeatureNumber", "FeatureType", "FeatureGroup", "FeatureGroupInterpretation", "TotalCount", "ArtifactType", "ArtifactCategory"]
    # end
  elsif params['quadrat'] != nil and params['quadrat'].strip != ''
      @category = 'Quadrat ID'
      @category_values = params['quadrat']
      query2 = params['quadrat'].split("\r\n").map {|p| "\"QuadratID\" = '#{p}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
      @beads = AqOneQuadratBead.where(query)
      @buckles = AqOneQuadratBuckle.where(query)
      @buttons = AqOneQuadratButton.where(query)
      @bones = AqOneQuadratBone.where(query)
      @ceramics = AqOneQuadratCeramic.where(query)
      @glasses = AqOneQuadratGlass.where(query)
      @utensils = AqOneQuadratUtensil.where(query)
      @pipes = AqOneQuadratTobaccoPipe.where(query)
      @gen_artifacts = AqOneQuadratGenArtifact.where(query)
      @display_fields = ["ProjectName", "ProjectID", "QuadratID", "TotalCount", "Form", "ManufacturingTechnique", "Material", "VesselCategory", "CeramicDecTechAppliedColorCombination", "CeramicGenre", "ArtifactType"]
    # end
  elsif params['unit_types'] != nil and params['unit_types'].strip != ''
      query = params['unit_types'].map {|p| "\"UnitTypeID\" = '#{p}'" }.join(" OR ")
      # @beads = AqTwoBead.where(query)
      # @buckles = AqTwoBuckle.where(query)
      # @buttons = AqTwoButton.where(query)
      # @bones = AqTwoBone.where(query)
      # @ceramics = AqTwoCeramic.where(query)
      # @glasses = AqTwoGlass.where(query)
      # @utensils = AqTwoUtensil.where(query)
      # @pipes = AqTwoTobaccoPipe.where(query)
      # @gen_artifacts = AqTwoGenArtifact.where(query)
    else
      @category = 'Sites'
      @category_values = ''
      query = "where #{query}" if query != ''
      query = aq_one_site(query)
      
      @artifacts = AqOneSiteBead.find_by_sql(query)
      total = AqOneSiteBead.find_by_sql("select sum(\"Total Count\") as \"Total Count\" from (#{query}) n")
      if total.size > 0
        @artifact_total = total.first.send('Total Count')
      else
        @artifact_total = 0
      end

      # @beads = AqOneBead.where(query)
      # @buckles = AqOneBuckle.where(query)
      # @buttons = AqOneButton.where(query)
      # @bones = AqOneBone.where(query)
      # @ceramics = AqOneCeramic.where(query)
      # @glasses = AqOneGlass.where(query)
      # @utensils = AqOneUtensil.where(query)
      # @pipes = AqOneTobaccoPipe.where(query)
      # @gen_artifacts = AqOneGenArtifact.where(query)
      #
      # @artifact_total = AqOneBead.where(query).sum("Total Count")
      # @artifact_total += AqOneBuckle.where(query).sum("Total Count")
      # @artifact_total += AqOneButton.where(query).sum("Total Count")
      # @artifact_total += AqOneBone.where(query).sum("Total Count")
      # @artifact_total += AqOneCeramic.where(query).sum("Total Count")
      # @artifact_total += AqOneGlass.where(query).sum("Total Count")
      # @artifact_total += AqOneUtensil.where(query).sum("Total Count")
      # @artifact_total += AqOneTobaccoPipe.where(query).sum("Total Count")
      # @artifact_total += AqOneGenArtifact.where(query).sum("Total Count")
      
      @display_fields = ["ProjectName", "Total Count", "Artifact Type", "Artifact Category"]
    
    end
    
    # @beads = AqTwoBead.where(query)
    # @buckles = AqTwoBuckle.where(query)
    # @buttons = AqTwoButton.where(query)
    # @bones = AqTwoBone.where(query)
    # @ceramics = AqTwoCeramic.where(query)
    # @glasses = AqTwoGlass.where(query)
    # @utensils = AqTwoUtensil.where(query)
    # @pipes = AqTwoTobaccoPipe.where(query)
    # @gen_artifacts = AqTwoGenArtifact.where(query)
    
    # @artifacts = @beads + @buckles + @buttons + @ceramics + @glasses + @bones + @gen_artifacts + @utensils + @pipes

    @total = @artifacts.size
    if params[:all] == nil
      @artifacts = Kaminari.paginate_array(@artifacts).page(@page).per(@per_page)
    end
      
    respond_to do |format|
      format.html {render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end

  def aq_three_results
    @page_title = 'AQ3'
    # byebug
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = "(#{params['sites'].map {|p| "\"a\".\"ProjectID\" = '#{p}'" }.join(" OR ")})"
    end
    if params[:ceramic_coarse_ew_fields] != nil
      query = query != '' ? "#{query} and " : query
      query += "(#{params[:ceramic_coarse_ew_fields].map {|p| "\"l\".\"Ware\" = '#{p}'" }.join(" OR ")})"
    end
    if params[:ceramic_porcelain_fields] != nil
      query = query != '' ? "#{query} and " : query
      query += "(#{params[:ceramic_porcelain_fields].map {|p| "\"l\".\"Ware\" = '#{p}'" }.join(" OR ")})"
    end
    if params[:ceramic_refined_ew_fields] != nil
      query = query != '' ? "#{query} and " : query
      query += "(#{params[:ceramic_refined_ew_fields].map {|p| "\"l\".\"Ware\" = '#{p}'" }.join(" OR ")})"
      # query = params[:ceramic_refined_ew_fields].map {|p| "\"l\".\"Ware\" = '#{p}'" }.join(" OR ")
    end
    if params[:ceramic_stoneware_fields] != nil
      query = query != '' ? "#{query} and " : query
      query += "(#{params[:ceramic_stoneware_fields].map {|p| "\"l\".\"Ware\" = '#{p}'" }.join(" OR ")})"
    end
    if params[:ceramic_form_fields] != nil
      query = query != '' ? "#{query} and " : query
      query += "(#{params[:ceramic_form_fields].map {|p| "\"u\".\"CeramicForm\" = '#{p}'" }.join(" OR ")})"
    end
    if params[:glass_material_fields] != nil
      query = query != '' ? "#{query} and " : query
      query += "(#{params[:glass_material_fields].map {|p| "\"j\".\"GlassMaterial\" = '#{p}'" }.join(" OR ")})"
    end
    if params[:glass_form_fields] != nil
      query = query != '' ? "#{query} and " : query
      query += "(#{params[:glass_form_fields].map {|p| "\"m\".\"GlassForm\" = '#{p}'" }.join(" OR ")})"
    end
    if params[:gen_artifact_material_fields] != nil
      query = query != '' ? "#{query} and " : query
      query += "(#{params[:gen_artifact_material_fields].map {|p| "\"ma\".\"GenArtifactMaterialType\" = '#{p}'" }.join(" OR ")})"
    end
    if params[:gen_artifact_form_fields] != nil
      query = query != '' ? "#{query} and " : query
      query += "(#{params[:gen_artifact_form_fields].map {|p| "\"k\".\"GenArtifactForm\" = '#{p}'" }.join(" OR ")})"
    end

    if params['daacs'] != nil and params['daacs'] != ''
      query = query != '' ? "#{query} and \"a\".\"Published\" = 1" : "\"a\".\"Published\" = 1"
    end
    @display_fields = ["ProjectName", "ProjectID", "Context", 'DepositType', 'UnitType', 'FeatureType', "FeatureNumber", "FeatureGroupNumber", "FeatureGroupInterpretation", "StratigraphicGroup", "DAACSStratigraphicGroupInterpretation", "DAACS Phase", "ArtifactID", "Count"]
    @category = ''
    @category_values = ''
    if params['context'] != nil and params['context'].strip != ''
      @category = 'Context'
      @category_values = params['context']
      query2 = params['context'].split("\r\n").map {|p| "\"Context\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
    elsif params['feature_number'] != nil and params['feature_number'].strip != ''
      @category = 'Feature Number'
      @category_values = params['feature_number']
      query2 = params['feature_number'].split("\r\n").map {|p| "e.\"FeatureNumber\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
      
    elsif params['phase'] != nil and params['phase'] != ''
      @category = 'Phase'
      @category_values = params['phase']
      
      query2 = params['phase'].split("\r\n").map {|p| "\"DAACSPhase\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
    elsif params['strat_group'] != nil and params['strat_group'].strip != ''
      @category = 'Stratiographic Group'
      @category_values = params['strat_group']
      query2 = params['strat_group'].split("\r\n").map {|p| "\"DAACSStratigraphicGroup\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
    elsif params['feature_group'] != nil and params['feature_group'].strip != ''
      @category = 'Feature Group'
      @category_values = params['feature_group']
      query2 = params['feature_group'].split("\r\n").map {|p| "e.\"FeatureGroup\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
    elsif params['feature_types'] != nil and params['feature_types'] != ''
      @category = 'Feature Type'
      @category_values = params['feature_type']
      query2 = ''
      query2 = params['feature_types'].map {|p| "\"FeatureType\" = '#{p.gsub("'","''")}'" }.join(" OR ") if params['feature_types'] != nil
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
    end
    if params[:bead_selected] != nil and params[:bead_selected] != ''
      @display_fields += params[:beads] if params[:beads] != nil
      @artifact_type = 'Bead'
      query = "where #{query}" if query != ''
      if params[:all] != 'related'
        query = aq_three_bead_concat(query)
        @artifacts = AqThreeConcatBead.find_by_sql(query)
        total = AqThreeConcatBead.find_by_sql("select sum(\"Count\") as \"Count\" from (#{query}) n")
        if total.size > 0
          @artifact_total = total.first.Count
        else
          @artifact_total = 0
        end
      else
        query = aq_three_bead_related(query)
        @artifacts = AqThreeRelatedBead.find_by_sql(query)
        @display_fields = ["ProjectName", "ProjectID", "Context", 'DepositType', 'UnitType', 'FeatureType', "FeatureNumber", "FeatureGroupNumber", "FeatureGroupInterpretation", "StratigraphicGroup", "DAACSStratigraphicGroupInterpretation", "DAACS Phase", "ArtifactID", "Count",  "Completeness", "Material", "ManufacturingTechnique", "Structure", "Form", "Shape", "EndTreatment", "Heat Treated", "BeadColor", "DAACS Color Description", "Bead Munsell Color Range", "NumberofFacets", "BeadDecoration", "BeadDecBasicColor", "BeadDecDetailedColor", "BeadDecDescription", "CasingLayer", "BeadLayerBasicColor", "BeadLayerDetailedColor", "Diaphaneity", "PostManufacturingModification", "Patination", "Burned", "WeatheredEroded", "Length", "Width", "Height", "Weight", "SizeofPerforationI", "SizeofPerforationII", "Mended", "Conservation", "Notes", "Images", "ObjectID"]
        
      end
    elsif params[:buckle_selected] != nil and params[:buckle_selected] != ''
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber", "FeatureGroupInterpretation", "FeatureGroup", "StratigraphicGroup", "DAACSPhase", "ArtifactID", "Quantity"]
      @display_fields += params[:buckles] if params[:buckles] != nil
      @artifact_type = 'Buckle'
      query = "where #{query}" if query != ''
      if params[:all] != 'related'
        query = aq_three_buckle_concat(query)
        @artifacts = AqThreeConcatBuckle.find_by_sql(query)
        total = AqThreeConcatBuckle.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
        if total.size > 0
          @artifact_total = total.first.Quantity
        else
          @artifact_total = 0
        end
      else
        query = aq_three_buckle_related(query)
        @artifacts = AqThreeRelatedBuckle.find_by_sql(query)
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber", "FeatureGroupInterpretation", "FeatureGroup", "StratigraphicGroup", "DAACSPhase", "ArtifactID", "Quantity","BuckleType", "Completeness", "FramePlating", "BucklePart",  "BuckleMaterial",  "BuckleManuTech",  "BuckleShape",  "BuckleElement", "Length",  "Width",  "Weight", "PinCenterpointMeasure",  "BuckleDecTechType",  "BuckleDecMotif", "Marks", "Burned","Conservation", "Mended", "Post Manufacturing Modification","Notes", "Images", "ObjectID"]
        
      end
    elsif params[:button_selected] != nil and params[:button_selected] != ''
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber",
 "FeatureGroup", "DAACSStratigraphicGroup", "DAACSPhase","ArtifactID", "Count"]
      @display_fields += params[:buttons] if params[:buttons] != nil
      @artifact_type = 'Button'
      query = "where #{query}" if query != ''
      if params[:all] != 'related'
        query = aq_three_button_concat(query)
        @artifacts = AqThreeConcatButton.find_by_sql(query)
        total = AqThreeConcatButton.find_by_sql("select sum(\"Count\") as \"Count\" from (#{query}) n")
        if total.size > 0
          @artifact_total = total.first.Count
        else
          @artifact_total = 0
        end
      else
        query = aq_three_button_related(query)
        @artifacts = AqThreeRelatedButton.find_by_sql(query)
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber",
 "FeatureGroup", "DAACSStratigraphicGroup", "DAACSPhase","ArtifactID", "Count","Completeness", "Material", "ManufacturingTechnique", "ButtonType", "ButtonShape", "NonMetalButtonColor", "MetalButtonColor", "ButtonEye", "ShankMaterial", "ShankStyle", "ShankCondition", "2PieceButton:FaceMaterial", "2PieceButton:FaceManufacturingTechnique", "2PieceButton:JoinMethod", "Decoration?", "DecTechType",  "AppliedColor", "JewelInlayMaterial", "DecorativeMotif", "Back Stamp", "Length", "Width", "Diameter", "Height", "Weight", "Post-Manufacturing Modification", "Burned", "Conservation", "Notes", "Images", "ObjectID"]
        
      end
    elsif params[:ceramic_selected] != nil and params[:ceramic_selected] != ''
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber", "FeatureGroup", "FeatureGroupInterpretation", "StratigraphicGroup", "DAACSPhase", "ArtifactID", "Count"]
      @display_fields += params[:ceramic_fields] if params[:ceramic_fields] != nil
      @artifact_type = 'Ceramic'
      query = "where #{query}" if query != ''
      if params[:all] != 'related'
        query = aq_three_ceramic_concat(query)
        @artifacts = AqThreeConcatCeramic.find_by_sql(query)
        total = AqThreeConcatCeramic.find_by_sql("select sum(\"Count\") as \"Count\" from (#{query}) n")
        if total.size > 0
          @artifact_total = total.first.Count
        else
          @artifact_total = 0
        end
      else
        query = aq_three_ceramic_related(query)
        @artifacts = AqThreeRelatedCeramic.find_by_sql(query)
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber", "FeatureGroup", "FeatureGroupInterpretation", "StratigraphicGroup", "DAACSPhase", "ArtifactID", "Count", "Material", "ManufacturingTechnique", "Ware", "VesselCategory", "Form", "Mended?", "MendedForm", "Completeness", "ExteriorGlazeType", "ExteriorColor", "ExteriorGlazeOpacity", "InteriorGlazeType", "InteriorColor", "InteriorGlazeOpacity", "DecorationYN", "StylisticGenre", "StyElementIntExt", "StyElementLocation", "DecorativeTechniqueType", "StyElementDecColor", "StylisticElement", "StyElementMotif", "PatternName", "PatternReference", "Burned", "PostManufacturingModification", "UseWearLocation", "UseWearCompleteness", "UseWearPattern", "BaseMark", "Base MarkColor", "BaseMarkReference", "PasteColor", "OxidizedVsReduced", "CoarseEarthenwareType", "CoarseEarthenwareDecorativeMode", "Colonoware RimForm", "Colonoware RimAngle", "Maximum RimWidth", "Coarse EarthenwareBaseForm", "CoarseEarthenwareFootringForm", "CoarseEarthenwarePasteInclusionDensity", "PasteInclusions", "ColonoCompleteness", "ColonoSherdThickness", "SherdThickness", "MaximumSherdMeasurement", "SherdWeight", "MendedSherdWeight", "RimLength", "RimDiameter", "MendedRimDiameter", "MaxRimWidth", "BaseLength", "BaseDiameter", "MendedBaseDiameter", "Notes", "Images", "ArtifactsMendedTo", "ObjectID"]
        
      end

    elsif params[:glass_selected] != nil and params[:glass_selected] != ''
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber", "FeatureGroup", "FeatureGroupInterpretation", "StratigraphicGroup", "DAACSPhase", "ArtifactID", "Count"]
      @display_fields += params[:glass_fields] if params[:glass_fields] != nil
      @artifact_type = 'Glass'
      query = "where #{query}" if query != ''
      if params[:all] != 'related'
        query = aq_three_glass_concat(query)
        @artifacts = AqThreeConcatGlass.find_by_sql(query)
        total = AqThreeConcatGlass.find_by_sql("select sum(\"Count\") as \"Count\" from (#{query}) n")
        if total.size > 0
          @artifact_total = total.first.Count
        else
          @artifact_total = 0
        end
      else
        query = aq_three_glass_related(query)
        @artifacts = AqThreeRelatedGlass.find_by_sql(query)
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber", "FeatureGroup", "FeatureGroupInterpretation", "StratigraphicGroup", "DAACSPhase", "ArtifactID", "Count", "Material", "Color", "VesselCategory", "Form", "Completeness", "ManufacturingTechnique", "MoldType", "BottleElement", "BottleShape", "BottleManutech", "Decoration", "DecorativeTechniqueType", "AppliedColor", "StylisticElement", "GlassMarkDescription", "GlassMarkLocation", "PostManufacturingModification", "Mended", "PontilMark", "TotalContainerHeight", "StemwareBodyShape", "StemwareFootShape", "StemShape", "StemLength", "Burned", "Patination", "Solarized", "SherdSize", "SherdThickness", "SherdWeight", "MendedSherdWeight", "LengthofRim", "RimDiameter", "MendedRimDiameter", "BaseDiameter", "BaseLength", "MendedBaseDiameter", "Conservation", "Images", "ArtifactsMendedTo", "ObjectID","Notes"]
        
      end
    elsif params[:gen_artifact_selected] != nil and params[:gen_artifact_selected] != ''
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber", "FeatureGroup", "FeatureGroupInterpretation", "StratigraphicGroup", "DAACSPhase", "ArtifactID", "Count"]
      @display_fields += params[:gen_artifact_fields] if params[:gen_artifact_fields] != nil
      @artifact_type = 'Gen Artifact'
      query = "where #{query}" if query != ''
      if params[:all] != 'related'
        query = aq_three_gen_artifact_concat(query)
        @artifacts = AqThreeConcatGenArtifact.find_by_sql(query)
        total = AqThreeConcatGenArtifact.find_by_sql("select sum(\"Count\") as \"Count\" from (#{query}) n")
        if total.size > 0
          @artifact_total = total.first.Count
        else
          @artifact_total = 0
        end
      else
        query = aq_three_gen_artifact_related(query)
        @artifacts = AqThreeRelatedGenArtifact.find_by_sql(query)
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber", "FeatureGroup", "FeatureGroupInterpretation", "StratigraphicGroup", "DAACSPhase", "ArtifactID", "Count", "Category", "Form", "Completeness","Material", "ManufacturingTechnique", "NailHeadType", "DecorationYN?", "DecorativeTechniqueType", "AppliedColor", "DecorationNotes", "NailEndType", "NailModification", "NailLength", "CoinDate", "BrickSize", "Mended", "PostManufacturingModification", "Burned", "Length",  "Width", "Height", "Weight", "Marks", "Notes", "Conservation", "Images","ObjectID"]
        
      end
    elsif params[:bone_selected] != nil and params[:bone_selected] != ''
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber", "FeatureGroup", "FeatureGroupInterpretation", "StratigraphicGroup", "DAACSPhase", "ArtifactID", "Count"]
      @display_fields += params[:bone_fields] if params[:bone_fields] != nil
      @artifact_type = 'Faunal'
      query = "where #{query}" if query != ''
      if params[:all] != 'related'
        query = aq_three_bone_concat(query)
        @artifacts = AqThreeConcatBone.find_by_sql(query)
        total = AqThreeConcatBone.find_by_sql("select sum(\"Count\") as \"Count\" from (#{query}) n")
        if total.size > 0
          @artifact_total = total.first.Count
        else
          @artifact_total = 0
        end
      else
        query = aq_three_bone_related(query)
        @artifacts = AqThreeRelatedBone.find_by_sql(query)
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber", "FeatureGroup", "FeatureGroupInterpretation", "StratigraphicGroup", "DAACSPhase", "ArtifactID", "Count", "Reliability", "TaxonEnglish", "TaxonLatin", "TaxonOrder", "TaxonCategory", "TaxonGroupCategory", "BodyPart", "Element", "Symmetry", "NISP", "BoneWeight", "BoneLocation", "BoneDescriptor", "BoneSize", "Fusion", "SexExpand", "ChewType", "ChewLocation", "FreshBreak", "ToothType", "ToothWear", "DiseaseTrauma", "Weathered?", "Burned?", "BoneCondition", "NumberCutMarks", "ButcherMethod", "ButcherLocation", "ButcherDirection", "CutType", "CutLocation", "CutDirection", "Meat WeightAdult", "Meat Weight mmature", "Notes", "Identifier", "DateIdentified", "MeasurementAccuracy"]
        
      end
    elsif params[:tobacco_pipe_selected] != nil and params[:tobacco_pipe_selected] != ''
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber", "FeatureGroup", "FeatureGroupInterpretation", "StratigraphicGroup", "DAACSPhase", "ArtifactID", "Count"]
      @display_fields += params[:tobacco_pipe_fields] if params[:tobacco_pipe_fields] != nil
      @artifact_type = 'Tobacco Pipe'
      query = "where #{query}" if query != ''
      if params[:all] != 'related'
        query = aq_three_tobacco_pipe_concat(query)
        @artifacts = AqThreeConcatTobaccoPipe.find_by_sql(query)
        total = AqThreeConcatTobaccoPipe.find_by_sql("select sum(\"Count\") as \"Count\" from (#{query}) n")
        if total.size > 0
          @artifact_total = total.first.Count
        else
          @artifact_total = 0
        end
      else
        query = aq_three_tobacco_pipe_related(query)
        @artifacts = AqThreeRelatedTobaccoPipe.find_by_sql(query)
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber", "FeatureGroup", "FeatureGroupInterpretation", "StratigraphicGroup", "DAACSPhase", "ArtifactID", "Count", "Completeness", "Material", "PasteColor", "PasteInclusion", "ManuTech", "Glaze", "GlazeColor", "Decoration?", "DecorativeMotif", "MotifLocation", "MotifManuTech", "MotifNotes", "TextMark?", "TextMarkType", "TextLocation", "TextFrameMotif", "FirstName", "LastName", "PlaceName", "Slogan/Other", "MarkNotes", "PipeMaker", "ProductionDates", "ManufactureLocation", "CompleteMarkDescription", "Post ManufacturingModification", "BowlForm", "BaseType", "MouthpieceForm", "MaximumSherdMeasurement", "StemLength", "ExteriorStemDiameter", "BoreDiameter64ths", "MetricBoreDiameter", "BowlHeight", "BowlVolume", "MaximumBowlDiameter","BowlRimDiameter", "Weight","Conservation", "Images", "ObjectID", "Notes"]
      end
    elsif params[:utensil_selected] != nil and params[:utensil_selected] != ''
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber", "FeatureGroup", "FeatureGroupInterpretation", "StratigraphicGroup", "DAACSPhase", "ArtifactID", "Count"]
      @display_fields += params[:utensil_fields] if params[:utensil_fields] != nil
      @artifact_type = 'Utensil'
      query = "where #{query}" if query != ''
      if params[:all] != 'related'
        query = aq_three_utensil_concat(query)
        @artifacts = AqThreeConcatUtensil.find_by_sql(query)
        total = AqThreeConcatUtensi.find_by_sql("select sum(\"Count\") as \"Count\" from (#{query}) n")
        if total.size > 0
          @artifact_total = total.first.Count
        else
          @artifact_total = 0
        end
      else
        query = aq_three_utensil_related(query)
        @artifacts = AqThreeRelatedUtensil.find_by_sql(query)
        @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "FeatureType", "FeatureNumber", "FeatureGroup", "FeatureGroupInterpretation", "StratigraphicGroup", "DAACSPhase", "ArtifactID", "Count", "Completeness", "UtensilForm", "ForkTineCount", "PresenceofRatTail", "UtensilPart", "PartShape", "PartManufacturingTechnique", "PartMaterial",  "PartLength", "PartWidth", "PartHeight", "Decoration", "Marks", "UtensilPlating", "HandleDecoration", "ArtifactLength", "ArtifactWidth", "ArtifactWeight", "Burned", "PostManufacturingModification", "Conservation", "Mended", "Images", "ObjectID",
"Notes"]
        
      end

    end
    @total = @artifacts.size
    if params[:all] == nil
      # byebug
      @artifacts = Kaminari.paginate_array(@artifacts).page(@page).per(@per_page)
    end
      
    respond_to do |format|
      format.html {render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end

  def query_objects_results
    @page_title = 'OQ1'
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = params['sites'].map {|p| "\"ProjectID\" = '#{p}'" }.join(" OR ")
    end
    if params['daacs'] != nil and params['daacs'] != ''
      query = query != '' ? "#{query} and \"Published\" = 1" : "\"Published\" = 1"
    end
    @display_fields = [ "ObjectID",  'InstitutionalObjectNumber',"ProjectName", "Object Type",  "Object Material", "Ware",  "Manufacturing Tech", "Vessel Category",  "Form", "Shape", "Completeness", "ObjectDescription"]
    @category = ''
    @category_values = ''
    
    if params[:all] == nil
        @objects = QueryObject.where(query).page(@page).per(@per_page)
        @total = QueryObject.where(query).count()
      else
        @objects = QueryObject.where(query)
      end
    respond_to do |format|
      format.html {render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end

  def query_objects_two_results
    @page_title = 'OQ2'
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = params['sites'].map {|p| "\"ProjectID\" = '#{p}'" }.join(" OR ")
    end
    if params['daacs'] != nil and params['daacs'] != ''
      query = query != '' ? "#{query} and \"Published\" = 1" : "\"Published\" = 1"
    end
    @display_fields = [ "ObjectID", 'InstitutionalObjectNumber', "ProjectName", "Object Type",  "Object Material", "Ware",  "Manufacturing Tech", "Vessel Category",  "Form", "Shape", "Completeness", "ObjectColor", "ObjectDescription", "Notes", "InstitutionalObjectNumber", "CuratingInstitution", "ObjectLocation", "Conserved?", "ConservationNotes", "ObjectLength", "ObjectLengthCompleteMeasurement?", "ObjectWidth", "WidthCompleteMeasurement?", "ObjectHeight", "HeightCompleteMeasurement?", "ObjectWeight", "ObjectCapacity", "ObjectRimDiameter", "ObjectBaseDiameter", "ObjectHeightRimToBase", "ExhibitLength", "ExhibitWidth", "ExhibitHeight", "DecorativeTechnique", "DecorationColor", "DecorationPattern", "DecorationNotes", "ObjectDate", "ExcavatorPhase", "DAACSPhase", "ObjectArtifactIDs", "ObjectLoanInformation"]
    @category = ''
    @category_values = ''
    
    if params[:all] != 'related'
        @objects = QueryObjectsTwoConcat.where(query).page(@page).per(@per_page)
        @total = QueryObjectsTwoConcat.where(query).count()
      else
        @objects = QueryObjectsTwoRelated.where(query)
        @display_fields = [ "ObjectID",  "Object Type", "ProjectName", "Object Material", "Ware",  "Manufacturing Tech", "Vessel Category",  "Form",  "Shape",  "Completeness", "ObjectColor", "ObjectDescription", "Notes", "InstitutionalObjectNumber", "CuratingInstitution", "ObjectLocation", "Conserved?", "ConservationNotes", "ObjectLength", "ObjectLengthCompleteMeasurement?", "ObjectWidth", "WidthCompleteMeasurement?","ObjectHeight", "HeightCompleteMeasurement?","ObjectWeight", "ObjectCapacity", "ObjectRimDiameter", "ObjectBaseDiameter", "ObjectHeightRimToBase", "ExhibitLength", "ExhibitWidth", "ExhibitHeight", "DecorativeTechnique", "DecorationColor", "DecorationPattern", "DecorationNotes", "ObjectDate", "ExcavatorPhase", "DAACSPhase", "ObjectArtifactIDs", "LoanedTo", "InstitutionContact", "ExhibitName", "ArtifactHandler", "LoanLength", "DateLoaned", "DateReturned", "ImageID"]
      end
    respond_to do |format|
      format.html {render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end

  def query_objects_three_results
    @page_title = 'OQ3'
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    if params['sites'] != nil
      query = params['sites'].map {|p| "\"ProjectID\" = '#{p}'" }.join(" OR ")
    end
    if params['daacs'] != nil and params['daacs'] != ''
      query = query != '' ? "#{query} and \"Published\" = 1" : "\"Published\" = 1"
    end
    if params['object_id'] != nil and params['object_id'] != ''
      @category = 'ObjectID'
      @category_values = params['object_id']
      query2 = ''
      query2 = params['object_id'].split("\r\n").map {|p| "\"object_id_str\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      # query2 = params['object_id'].split("\r\n").map {|p| "\"ObjectID\" = #{p.gsub('*','')}" }.join(" OR ")
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
    elsif params['inst_obj_number'] != nil and params['inst_obj_number'] != ''
      @category = 'InstitutionalObjectNumber'
      @category_values = params['inst_obj_number']
      query2 = ''
      query2 = params['inst_obj_number'].split("\r\n").map {|p| "\"InstitutionalObjectNumber\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      # query2 = params['object_id'].split("\r\n").map {|p| "\"ObjectID\" = #{p.gsub('*','')}" }.join(" OR ")
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''

    elsif params['object_types'] != nil and params['object_types'] != ''
      @category = 'Object Type'
      @category_values = params['object_id']
      query2 = ''
      query2 = params['object_types'].map {|p| "\"Object Type\" = '#{p.gsub("'","''")}'" }.join(" OR ") if params['object_types'] != nil
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
    elsif params['object_forms'] != nil and params['object_forms'] != ''
      @category = 'Object Form'
      @category_values = params['object_forms']
      query2 = ''
      query2 = params['object_forms'].map {|p| "\"Form\" = '#{p.gsub("'","''")}'" }.join(" OR ") if params['object_forms'] != nil
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
    elsif params['wares'] != nil and params['wares'] != ''
      @category = 'Ware'
      @category_values = params['object_id']
      query2 = ''
      query2 = params['wares'].map {|p| "\"Ware\" = '#{p.gsub("'","''")}'" }.join(" OR ") if params['wares'] != nil
      query = query != '' ? "(#{query})" : query
      query = "#{query} and (#{query2})" if query2 != ''
    end
      
    @display_fields = [ "ObjectID", 'InstitutionalObjectNumber', "ProjectName", "Object Type",  "Object Material", "Ware",  "Manufacturing Tech", "Vessel Category",  "Form", "Shape", "Completeness", "ObjectColor", "ObjectDescription", "Notes", "InstitutionalObjectNumber", "CuratingInstitution", "ObjectLocation", "Conserved?", "ConservationNotes", "ObjectLength", "ObjectLengthCompleteMeasurement?", "ObjectWidth", "WidthCompleteMeasurement?", "ObjectHeight", "HeightCompleteMeasurement?", "ObjectWeight", "ObjectCapacity", "ObjectRimDiameter", "ObjectBaseDiameter", "ObjectHeightRimToBase", "ExhibitLength", "ExhibitWidth", "ExhibitHeight", "DecorativeTechnique", "DecorationColor", "DecorationPattern", "DecorationNotes", "ObjectDate", "ExcavatorPhase", "DAACSPhase", "ObjectArtifactIDs", "ObjectLoanInformation"]
    @category = ''
    @category_values = ''
    
    if params[:all] != 'related'
        @objects = QueryObjectsThreeConcat.where(query).page(@page).per(@per_page)
        @total = QueryObjectsThreeConcat.where(query).count()
      else
        @objects = QueryObjectsThreeRelated.where(query)
        @display_fields = [ "ObjectID", 'InstitutionalObjectNumber', "ProjectName", "Object Type",  "Object Material", "Ware",  "Manufacturing Tech", "Vessel Category",  "Form",  "Shape",  "Completeness", "ObjectColor", "ObjectDescription", "Notes", "InstitutionalObjectNumber", "CuratingInstitution", "ObjectLocation", "Conserved?", "ConservationNotes", "ObjectLength", "ObjectLengthCompleteMeasurement?", "ObjectWidth", "WidthCompleteMeasurement?","ObjectHeight", "HeightCompleteMeasurement?","ObjectWeight", "ObjectCapacity", "ObjectRimDiameter", "ObjectBaseDiameter", "ObjectHeightRimToBase", "ExhibitLength", "ExhibitWidth", "ExhibitHeight", "DecorativeTechnique", "DecorationColor", "DecorationPattern", "DecorationNotes", "ObjectDate", "ExcavatorPhase", "DAACSPhase", "ObjectArtifactIDs", "LoanedTo", "InstitutionContact", "ExhibitName", "ArtifactHandler", "LoanLength", "DateLoaned", "DateReturned", "ImageID"]
      end
    respond_to do |format|
      format.html {render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end

  def query_context_one_results
    @page_title = 'CQ1'
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = "(#{params['sites'].map {|p| "\"ProjectID\" = '#{p}'" }.join(" OR ")})"
    end
    if params['daacs'] != nil and params['daacs'] != ''
      query = query != '' ? "#{query} and \"Published\" = 1" : "\"Published\" = 1"
    end
    @display_fields = ["Project Name",  "ProjectID", "Context",
"QuadratID", "MeanQuadratNorthing", "MeanQuadratEasting", "STPNorthing", "STPEasting", "DepositType", "UnitType", "FeatureType", "FeatureNumber", "Feature Group", "FeatureGroupInterpretation", "DAACSStratigraphicGroup","DAACSStratigraphicGroupInterpretation", "DAACSPhase", "ExcavatorSedimentDescription", "ExcavatorInterpretation", "ContextLength", "ContextWidth", "MaximumLithostratigraphicThickness", "UnitSize", "QuadratLength", "QuadratWidth", "ArtifactPresence", "ContextSampleID", "RecoveryMethod"]
    @category = ''
    @category_values = ''
    
    if params[:all] == nil
        @contexts = QueryContextOne.where(query).page(@page).per(@per_page)
        @total = QueryContextOne.where(query).count()
      else
        @contexts = QueryContextOne.where(query)
      end
    respond_to do |format|
      format.html {render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end

  def query_context_two_results
    @page_title = 'CQ2'
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = "(#{params['sites'].map {|p| "\"ProjectID\" = '#{p}'" }.join(" OR ")})"
    end
    if params['daacs'] != nil and params['daacs'] != ''
      query = query != '' ? "#{query} and \"Published\" = 1" : "\"Published\" = 1"
    end
    @display_fields = ["Project Name", "ProjectID", "Context", "ContextID", "Excavated", "DepositType", "UnitType", "QuadratID", "FeatureType", "FeatureNumber"]
    if params[:attributes] != nil and params[:attributes] != ''
      @display_fields += params[:attributes]
    end
    # byebug
    puts "-------------------#{params[:feature_types_selected]}"
    if params[:feature_types_selected] != nil and params[:feature_types_selected] != ''
          @context_type = 'Feature Type'
          @category = 'Feature Type'
          @category_values = params['feature_types'] != nil ? params['feature_types'].join(', ') : ''
          query2 = ''
          if params['feature_types'] != nil and params['feature_types'] != ''
            query2 = params['feature_types'].map {|p| "\"FeatureType\" = '#{p.gsub("'","''")}'" }.join(" OR ") if params['feature_types'] != nil
            query = query != '' ? "(#{query})" : ''
          end
          query = query2 != '' ? "#{query} and (#{query2})" : "#{query} and \"FeatureType\" is not null"
          if params[:elevation_selected] != nil and params[:elevation_selected] != ''
            @display_fields += ["ElevationType", "ElevationLocation", "ElevationReading"]
            @contexts = CqTwoFeatureTypeElevationRelated.where(query)
          elsif params[:sediment_selected] != nil and params[:sediment_selected] != ''
            @display_fields += ["SedimentTexture", "MunsellSedimentColor", "ExcavatorSedimentColorDescription", "SedimentPercentage", "InclusionDescription", "InclusionSize"]
            @contexts = CqTwoFeatureTypeSediment.where(query)
          elsif params[:strat_group_selected] != nil and params[:strat_group_selected] != ''
            @display_fields += ["StratigraphicRelationship", "RelatedContexts"]
            @contexts = CqTwoFeatureTypeStratRelated.where(query)
          elsif params[:quadrat_selected] != nil and params[:quadrat_selected] != ''
            @display_fields += ["QuadratNorthing", "QuadratEasting"]
            @contexts = CqTwoFeatureTypeQuadrat.where(query)
          elsif params[:context_sample_selected] != nil and params[:context_sample_selected] != ''
            @display_fields += ["ContextSampleID", "RecoveryMethod", "SampleNumber", "SampleSize", "ContextSampleType", "ScreenSize", "StorageBoxNumber", "BoxComments"]
            @contexts = CqTwoFeatureTypeContextSample.where(query)
          elsif params[:feature_selected] != nil and params[:feature_selected] != ''
            @display_fields += ["Description", "FeatureTPQ", "Length", "Width", "Depth", "OriginalPitCutLength", "OriginalPitCutWidth", "OriginalPitCutDepth", "PlanShape", "ProfileShape", "CentroidX", "CentroidY", "Feature Group", "FeatureGroupInterpretation"]
            @contexts = CqTwoFeatureTypeFeature.where(query)
          else
            @contexts = CqTwoFeatureTypeNoRelated.where(query)
            
          end
          @q = query
          # byebug
          
          # @display_fields += params[:feature_types] if params[:feature_types] != nil
        elsif params[:feature_number_selected] != nil and params[:feature_number_selected] != ''
          @context_type = 'Feature Number'
          query2 = ''
          if params['feature_number'].to_s != '' and params['feaure_number'].to_s != '*'
            query2 = params['feature_number'].split("\r\n").map {|p| "\"FeatureNumber\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
          end
          query = query != '' ? "(#{query})" : ''
          query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"
          if params[:elevation_selected] != nil and params[:elevation_selected] != ''
            @display_fields += ["ElevationType", "ElevationLocation", "ElevationReading"]
            @contexts = CqTwoFeatureNumberElevationRelated.where(query)
          elsif params[:sediment_selected] != nil and params[:sediment_selected] != ''
            @display_fields += ["SedimentTexture", "MunsellSedimentColor", "ExcavatorSedimentColorDescription", "SedimentPercentage", "InclusionDescription", "InclusionSize"]
            @contexts = CqTwoFeatureNumberSediment.where(query)
          elsif params[:strat_group_selected] != nil and params[:strat_group_selected] != ''
            @display_fields += ["StratigraphicRelationship", "RelatedContexts"]
            @contexts = CqTwoFeatureNumberStratRelated.where(query)
          elsif params[:quadrat_selected] != nil and params[:quadrat_selected] != ''
            @display_fields += ["QuadratNorthing", "QuadratEasting"]
            @contexts = CqTwoFeatureNumberQuadrat.where(query)
          elsif params[:context_sample_selected] != nil and params[:context_sample_selected] != ''
            @display_fields += ["ContextSampleID", "RecoveryMethod", "SampleNumber", "SampleSize", "ContextSampleType", "ScreenSize", "StorageBoxNumber", "BoxComments"]
            @contexts = CqTwoFeatureNumberContextSample.where(query)
          elsif params[:feature_selected] != nil and params[:feature_selected] != ''
            @display_fields += ["Description", "FeatureTPQ", "Length", "Width", "Depth", "OriginalPitCutLength", "OriginalPitCutWidth", "OriginalPitCutDepth", "PlanShape", "ProfileShape", "CentroidX", "CentroidY", "Feature Group", "FeatureGroupInterpretation"]
            @contexts = CqTwoFeatureNumberFeature.where(query)
          else
            @contexts = CqTwoFeatureNumberNoRelated.where(query)
          end
          # @display_fields += params[:feature_numbers] if params[:feature_numbers] != nil
        elsif params[:unit_types_selected] != nil and params[:unit_types_selected] != ''
          @context_type = 'Unit Type'
          query2 = ''
          if params['unit_types'] != nil and params['unit_types'] != ''
            query2 = params['unit_types'].map {|p| "\"UnitType\" = '#{p.gsub("'","''")}'" }.join(" OR ") if params['unit_types'] != nil
            query = query != '' ? "(#{query})" : ''
          end
          query = query2 != '' ? "#{query} and (#{query2})" : "#{query} and \"UnitType\" is not null"
          if params[:elevation_selected] != nil and params[:elevation_selected] != ''
            @display_fields += ["ElevationType", "ElevationLocation", "ElevationReading"]
            @contexts = CqTwoUnitTypeElevationRelated.where(query)
          elsif params[:sediment_selected] != nil and params[:sediment_selected] != ''
            @display_fields += ["SedimentTexture", "MunsellSedimentColor", "ExcavatorSedimentColorDescription", "SedimentPercentage", "InclusionDescription", "InclusionSize"]
            @contexts = CqTwoUnitTypeSediment.where(query)
          elsif params[:strat_group_selected] != nil and params[:strat_group_selected] != ''
            @display_fields += ["StratigraphicRelationship", "RelatedContexts"]
            @contexts = CqTwoUnitTypeStratRelated.where(query)
          elsif params[:quadrat_selected] != nil and params[:quadrat_selected] != ''
            @display_fields += ["QuadratNorthing", "QuadratEasting"]
            @contexts = CqTwoUnitTypeQuadrat.where(query)
          elsif params[:context_sample_selected] != nil and params[:context_sample_selected] != ''
            @display_fields += ["ContextSampleID", "RecoveryMethod", "SampleNumber", "SampleSize", "ContextSampleType", "ScreenSize", "StorageBoxNumber", "BoxComments"]
            @contexts = CqTwoUnitTypeContextSample.where(query)
          elsif params[:feature_selected] != nil and params[:feature_selected] != ''
            @display_fields += ["Description", "FeatureTPQ", "Length", "Width", "Depth", "OriginalPitCutLength", "OriginalPitCutWidth", "OriginalPitCutDepth", "PlanShape", "ProfileShape", "CentroidX", "CentroidY", "Feature Group", "FeatureGroupInterpretation"]
            @contexts = CqTwoUnitTypeFeature.where(query)
          else
            @contexts = CqTwoUnitTypeNoRelated.where(query)
          end
          # @display_fields += params[:unit_types] if params[:unit_types] != nil
        elsif params[:project_selected] != nil and params[:project_selected] != ''
          @context_type = 'Project'
          query2 = ''
          if params['project'].to_s != '' and params['project'].to_s != '*'
            query2 = params['project'].split("\r\n").map {|p| "(\"Project Name\" ilike '#{p.gsub('*','%')}' or \"ProjectID\" ilike '#{p.gsub('*','%')}')" }.join(" OR ")
          end
          query = query != '' ? "(#{query})" : ''
          query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"
          if params[:elevation_selected] != nil and params[:elevation_selected] != ''
            @display_fields += ["ElevationType", "ElevationLocation", "ElevationReading"]
            @contexts = CqTwoProjectElevationRelated.where(query)
          elsif params[:sediment_selected] != nil and params[:sediment_selected] != ''
            @display_fields += ["SedimentTexture", "MunsellSedimentColor", "ExcavatorSedimentColorDescription", "SedimentPercentage", "InclusionDescription", "InclusionSize"]
            @contexts = CqTwoProjectSediment.where(query)
          elsif params[:strat_group_selected] != nil and params[:strat_group_selected] != ''
            @display_fields += ["StratigraphicRelationship", "RelatedContexts"]
            @contexts = CqTwoProjectStratRelated.where(query)
          elsif params[:quadrat_selected] != nil and params[:quadrat_selected] != ''
            @display_fields += ["QuadratNorthing", "QuadratEasting"]
            @contexts = CqTwoProjectQuadrat.where(query)
          elsif params[:context_sample_selected] != nil and params[:context_sample_selected] != ''
            @display_fields += ["ContextSampleID", "RecoveryMethod", "SampleNumber", "SampleSize", "ContextSampleType", "ScreenSize", "StorageBoxNumber", "BoxComments"]
            @contexts = CqTwoProjectContextSample.where(query)
          elsif params[:feature_selected] != nil and params[:feature_selected] != ''
            @display_fields += ["Description", "FeatureTPQ", "Length", "Width", "Depth", "OriginalPitCutLength", "OriginalPitCutWidth", "OriginalPitCutDepth", "PlanShape", "ProfileShape", "CentroidX", "CentroidY", "Feature Group", "FeatureGroupInterpretation"]
            @contexts = CqTwoProjectFeature.where(query)
          elsif params[:stp_selected] != nil and params[:stp_selected] != ''
            @display_fields = ["Project Name", "ProjectID", "Context", "ContextID", "Excavated", "DepositType", "UnitType"]
            
            @display_fields += ["STPNorthing", "STPEasting", "STPLevel", "STPClosing", "STPFineSediment", "STPSedimentColor", "STPSedimentPercentage", "STPInclusion", "STPInclusionSize", "STPInclusionPercentage"]
            @contexts = CqTwoProjectStp.where(query)
          end
          # @display_fields += params[:projects] if params[:projects] != nil

      end
      @total = @contexts.size
    if params[:all] == nil
      # byebug
      @contexts = Kaminari.paginate_array(@contexts).page(@page).per(@per_page)
    end
          
    respond_to do |format|
      format.html {render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end

  def query_sites_results
    @page_title = 'SQ'
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = "(#{params['sites'].map {|p| "\"ProjectID\" = '#{p}'" }.join(" OR ")})"
    end
    if params['daacs'] != nil and params['daacs'] != ''
      query = query != '' ? "#{query} and \"Published\" = 1" : "\"Published\" = 1"
    end
    @display_fields = ["ProjectID", "ProjectName", "Institution", "PlaceName", "Region", "County", "Country", "PlantationName","BeginDate", "PrincipalInvestigators", "EndDate", "OccupationRange", "StateSiteNumber", "UnitofMeasurement", "GeoDatum", "GeoCoordinateSystem", "NorthingGeoCoordinateofLocalDatum", "EastingGeoCoordinateofLocalDatum", "VerticalGeoCoordinateofLocalDatum", "Drainage", "SiteSoils", "NearestWaterSource", "DistancefromWaterSource", "ElevationType", "AzimuthOrientation", "TotalAreaExcavated", "TotalConvexHull", "DatesExcavated", "ArtifactRepository", "SiteAbstract"]
    @category = ''
    @category_values = ''
    
    if params[:all] == nil
        @sites = QuerySite.where(query).page(@page).per(@per_page)
        @total = QuerySite.where(query).count()
      else
        @sites = QuerySite.where(query)
      end
    respond_to do |format|
      format.html {render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end

  def mcd_one_results
    @page_title = 'MCD1'
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = "(#{params['sites'].map {|p| "\"ProjectID\" = '#{p}'" }.join(" OR ")})"
    end
    if params['daacs'] != nil and params['daacs'] != ''
      query = query != '' ? "#{query} and \"Published\" = 1" : "\"Published\" = 1"
    end
    @display_fields = []
    @category = ''
    @category_values = ''
    if params['context_selected'] != nil and params['context_selected'].strip != ''
      @category = 'Context'
      @category_values = params['context'].to_s.split("\r\n").map {|p| "#{p}" }.join(", ")
      query2 = params['context'].split("\r\n").map {|p| "\"Context\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query} and \"Context\" is not null"
      # query = "where #{query}" if query != ''
      # byebug

      @artifacts = McdOneContext.where(query)
      @artifact_total = @artifacts.size
      # total = AqTwoContext.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query_str}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      @display_fields = ["ProjectName","Context", "MCD", "BlueMCD", "TotalCount"]
      
    # end
  elsif params['feature_number_selected'] != nil and params['feature_number_selected'].strip != ''
      @category = 'Feature Number'
      @category_values = params['feature_number'].to_s.split("\r\n").map {|p| "#{p}" }.join(", ")
      query2 = ''
      if params['feature_number'].to_s != '' and params['feaure_number'].to_s != '*'
        query2 = params['feature_number'].split("\r\n").map {|p| "\"FeatureNumber\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      end
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query} and \"FeatureNumber\" is not null"
      
      
      @artifacts = McdOneFeatureNumber.where(query)
      # total = AqTwoFeatureNumber.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query_str}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      @display_fields = ["ProjectName","FeatureNumber", "MCD", "BlueMCD", "TotalCount"]
    # end
  elsif params['phase_selected'] != nil and params['phase_selected'] != ''
      @category = 'Phase'
      @category_values = params['phase']
      
      query2 = params['phase'].split("\r\n").map {|p| "\"DAACSPhase\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query} and \"DAACSPhase\" is not null"
      
  @artifacts = McdOnePhase.where(query)
  # total = AqTwoPhase.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
  # if total.size > 0
  #   @artifact_total = total.first.Quantity
  # else
  #   @artifact_total = 0
  # end
      
  @display_fields = ["ProjectName","DAACSPhase", "MCD", "BlueMCD", "TotalCount"]
      
    # end
  elsif params['strat_group_selected'] != nil and params['strat_group_selected'].strip != ''
      @category = 'Stratiographic Group'
      @category_values = params['strat_group'].to_s.split("\r\n").map {|p| "#{p}" }.join(", ")
      query2 = params['strat_group'].split("\r\n").map {|p| "\"DAACSStratigraphicGroup\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query} and \"DAACSStratigraphicGroup\" is not null"
 
      @artifacts = McdOneStratGroup.where(query)
      # total = AqTwoStratGroup.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query_str}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      
      @display_fields = ["ProjectName","DAACSStratigraphicGroup", "MCD", "BlueMCD", "TotalCount"]
      
    # end
  elsif params['feature_types_selected'] != nil and params['feature_types_selected'] != ''
      @category = 'Feature Type'
      @category_values = params['feature_types'] != nil ? params['feature_types'].join(', ') : ''
      query2 = ''
      query2 = params['feature_types'].map {|p| "\"FeatureType\" = '#{p.gsub("'","''")}'" }.join(" OR ") if params['feature_types'] != nil
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query} and \"FeatureType\" is not null"

      @artifacts = McdOneFeatureType.where(query)
      # total = AqTwoFeatureType.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      
      @display_fields = ["ProjectName","FeatureType", "MCD", "BlueMCD", "TotalCount"]
    # end
  elsif params['feature_group_selected'] != nil and params['feature_group_selected'] != ''
      @category = 'Feature Group'
      @category_values = params['feature_group'].to_s.split("\r\n").map {|p| "#{p}" }.join(", ")
      query2 = ''
      if params['feature_group'].to_s != '' and params['feaure_group'].to_s != '*'
        query2 = params['feature_group'].to_s.split("\r\n").map {|p| "\"FeatureGroup\" ilike '#{p.gsub("*","%")}'" }.join(" OR ") if params['feature_group'] != nil
      end
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query} and \"FeatureGroup\" is not null"

      @artifacts = McdOneFeatureGroup.where(query)
      # total = AqTwoFeatureType.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      
      @display_fields = ["ProjectName","FeatureGroup", "FeatureGroupInterpretation", "MCD", "BlueMCD", "TotalCount"]
    # end
  else
      @category = 'Sites'
      @category_values = ''
      query = query != '' ? "(#{query})" : ''
      
      @artifacts = McdOneSite.where(query)
      # total = AqTwoSite.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      
      @display_fields = ["ProjectName", "MCD", "BlueMCD", "TotalCount"]
    
    end
    

    @total = @artifacts.size
    if params[:all] == nil
      @artifacts = Kaminari.paginate_array(@artifacts).page(@page).per(@per_page)
    end
      
    respond_to do |format|
      format.html {render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end

  def mcd_two_results
    @page_title = 'MCD2'
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = "(#{params['sites'].map {|p| "\"ProjectID\" = '#{p}'" }.join(" OR ")})"
    end
    if params['daacs'] != nil and params['daacs'] != ''
      query = query != '' ? "#{query} and \"Published\" = 1" : "\"Published\" = 1"
    end
    @display_fields = []
    @category = ''
    @category_values = ''
    if params['context_selected'] != nil and params['context_selected'].strip != ''
      @category = 'Context'
      @category_values = params['context'].to_s.split("\r\n").map {|p| "#{p}" }.join(", ")
      query2 = params['context'].split("\r\n").map {|p| "\"Context\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"
      # query = "where #{query}" if query != ''
      # byebug

      @artifacts = McdTwoContext.where(query)
      @artifact_total = @artifacts.size
      # total = AqTwoContext.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query_str}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      @display_fields = ["ProjectName","Context", "DepositType", "DAACSStratigraphicGroup", "DAACSPhase", "FeatureNumber", "FeatureType", "FeatureGroup", "FeatureGroupInterpretation", "WareTypes", "Count", "Weight"]
      
    # end
  elsif params['feature_number_selected'] != nil and params['feature_number_selected'].strip != ''
      @category = 'Feature Number'
      @category_values = params['feature_number'].to_s.split("\r\n").map {|p| "#{p}" }.join(", ")
      query2 = params['feature_number'].split("\r\n").map {|p| "\"FeatureNumber\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"
      
      
      @artifacts = McdTwoFeatureNumber.where(query)
      # total = AqTwoFeatureNumber.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query_str}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      @display_fields = ["ProjectName","FeatureNumber", "FeatureType", "FeatureGroup", "FeatureGroupInterpretation", "WareTypes", "Count", "Weight"]
    # end
  elsif params['phase_selected'] != nil and params['phase_selected'] != ''
      @category = 'Phase'
      @category_values = params['phase']
      
      query2 = params['phase'].split("\r\n").map {|p| "\"DAACSPhase\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"
      
  @artifacts = McdTwoPhase.where(query)
  # total = AqTwoPhase.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
  # if total.size > 0
  #   @artifact_total = total.first.Quantity
  # else
  #   @artifact_total = 0
  # end
      
  @display_fields = ["ProjectName","DAACSPhase", "WareTypes", "Count", "Weight"]
      
    # end
  elsif params['strat_group_selected'] != nil and params['strat_group_selected'].strip != ''
      @category = 'Stratiographic Group'
      @category_values = params['strat_group'].to_s.split("\r\n").map {|p| "#{p}" }.join(", ")
      query2 = params['strat_group'].split("\r\n").map {|p| "\"DAACSStratigraphicGroup\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"
 
      @artifacts = McdTwoStratGroup.where(query)
      # total = AqTwoStratGroup.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query_str}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      
      @display_fields = ["ProjectName","DAACSStratigraphicGroup", "DAACSStratigraphicGroupInterpretation", "DAACSPhase", "WareTypes", "Count", "Weight"]
      
    # end
  elsif params['feature_types_selected'] != nil and params['feature_types_selected'] != ''
      @category = 'Feature Type'
      @category_values = params['feature_types'] != nil ? params['feature_types'].join(', ') : ''
      query2 = ''
      query2 = params['feature_types'].map {|p| "\"FeatureType\" = '#{p.gsub("'","''")}'" }.join(" OR ") if params['feature_types'] != nil
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"

      @artifacts = McdTwoFeatureType.where(query)
      # total = AqTwoFeatureType.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      
      @display_fields = ["ProjectName","FeatureType", "FeatureGroup", "FeatureGroupInterpretation", "WareTypes", "Count", "Weight"]
    # end
  elsif params['feature_group_selected'] != nil and params['feature_group_selected'] != ''
      @category = 'Feature Group'
      @category_values = params['feature_group'].to_s.split("\r\n").map {|p| "#{p}" }.join(", ")
      query2 = params['feature_group'].to_s.split("\r\n").map {|p| "\"FeatureGroup\" ilike '#{p.gsub("*","%")}'" }.join(" OR ") if params['feature_group'] != nil
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"

      @artifacts = McdTwoFeatureGroup.where(query)
      # total = AqTwoFeatureType.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      
      @display_fields = ["ProjectName","FeatureGroup", "FeatureGroupInterpretation", "WareTypes", "Count", "Weight"]
    # end
  else
      @category = 'Sites'
      @category_values = ''
      query = query != '' ? "(#{query})" : ''
      
      @artifacts = McdTwoSite.where(query)
      # total = AqTwoSite.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      
      @display_fields = ["ProjectName", "WareTypes", "Count", "Weight"]
    
    end
    

    @total = @artifacts.size
    if params[:all] == nil
      @artifacts = Kaminari.paginate_array(@artifacts).page(@page).per(@per_page)
    end
      
    respond_to do |format|
      format.html {render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end

  def query_faunal_two_results
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = "(#{params['sites'].map {|p| "\"ProjectID\" = '#{p}'" }.join(" OR ")})"
    end
    if params['daacs'] != nil and params['daacs'] != ''
      query = query != '' ? "#{query} and \"Published\" = 1" : "\"Published\" = 1"
    end
    @display_fields = ["ProjectName", "ProjectID", "Context", "QuadratID", "DepositType", "UnitType", "FeatureType", "FeatureNumber", "Feature Group", "FeatureGroupInterpretation", "DAACSStratigraphicGroup", "DAACSStratigraphicGroupInterpretation", "DAACSPhase", "TotalCount", "Reliability", "TaxonEnglish", "TaxonLatin", "TaxonOrder", "TaxonCategory", "TaxonGroupCategory", "BodyPart", "Element", "Symmetry", "NISP", "BoneWeight", "BoneLocation", "BoneDescriptor", "BoneSize", "Fusion", "SexExpand", "ChewType", "ChewLocation", "FreshBreak", "ToothType", "ToothWear", "DiseaseTrauma", "Weathered?", "Burned?", "BoneCondition", "NumberCutMarks", "ButcherMethod", "ButcherLocation", "ButcherDirection", "CutType", "CutLocation", "CutDirection", "Meat WeightAdult", "Meat Weight mmature", "Notes", "Identifier", "DateIdentified", "Accurate"]
    @category = ''
    @category_values = ''
    if params['context_selected'] != nil and params['context_selected'].strip != ''
      @category = 'Context'
      @category_values = params['context'].to_s.split("\r\n").map {|p| "#{p}" }.join(", ")
      query2 = params['context'].split("\r\n").map {|p| "\"Context\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"
      # query = "where #{query}" if query != ''
      # byebug

      @artifacts = QueryFaunalTwoContext.where(query)
      @artifact_total = @artifacts.size
      # total = AqTwoContext.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query_str}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      
    # end
  elsif params['feature_number_selected'] != nil and params['feature_number_selected'].strip != ''
      @category = 'Feature Number'
      @category_values = params['feature_number'].to_s.split("\r\n").map {|p| "#{p}" }.join(", ")
      query2 = params['feature_number'].split("\r\n").map {|p| "\"FeatureNumber\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"
      
      
      @artifacts = QueryFaunalTwoFeatureNumber.where(query)
      # total = AqTwoFeatureNumber.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query_str}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
    # end
  elsif params['phase_selected'] != nil and params['phase_selected'] != ''
      @category = 'Phase'
      @category_values = params['phase']
      
      query2 = params['phase'].split("\r\n").map {|p| "\"DAACSPhase\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"
      
  @artifacts = QueryFaunalTwoPhase.where(query)
  # total = AqTwoPhase.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
  # if total.size > 0
  #   @artifact_total = total.first.Quantity
  # else
  #   @artifact_total = 0
  # end
      
      
    # end
  elsif params['strat_group_selected'] != nil and params['strat_group_selected'].strip != ''
      @category = 'Stratiographic Group'
      @category_values = params['strat_group'].to_s.split("\r\n").map {|p| "#{p}" }.join(", ")
      query2 = params['strat_group'].split("\r\n").map {|p| "\"DAACSStratigraphicGroup\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"
 
      @artifacts = QueryFaunalTwoStratGroup.where(query)
      # total = AqTwoStratGroup.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query_str}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      
      
    # end
  elsif params['feature_types_selected'] != nil and params['feature_types_selected'] != ''
      @category = 'Feature Type'
      @category_values = params['feature_types'] != nil ? params['feature_types'].join(', ') : ''
      query2 = ''
      query2 = params['feature_types'].map {|p| "\"FeatureType\" = '#{p.gsub("'","''")}'" }.join(" OR ") if params['feature_types'] != nil
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"

      @artifacts = QueryFaunalTwoFeatureType.where(query)
      # total = AqTwoFeatureType.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      
    # end
  elsif params['unit_types_selected'] != nil and params['unit_types_selected'] != ''
      @category = 'Unit Type'
      @category_values = params['unit_types'] != nil ? params['unit_types'].join(', ') : ''
      query2 = ''
      query2 = params['unit_types'].map {|p| "\"UnitType\" = '#{p.gsub("'","''")}'" }.join(" OR ") if params['unit_types'] != nil
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"

      @artifacts = QueryFaunalTwoUnitType.where(query)
      # total = AqTwoFeatureType.find_by_sql("select sum(\"Quantity\") as \"Quantity\" from (#{query}) n")
      # if total.size > 0
      #   @artifact_total = total.first.Quantity
      # else
      #   @artifact_total = 0
      # end
      
    # end
    
    end
    

    @total = @artifacts.size
    if params[:all] == nil
      @artifacts = Kaminari.paginate_array(@artifacts).page(@page).per(@per_page)
    end
      
    respond_to do |format|
      format.html {render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end
  
  def query_one_image_results
    @page_title = 'IQ1'
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = "(#{params['sites'].map {|p| "a.\"ProjectID\" = '#{p}'" }.join(" OR ")})"
    end
    if params['daacs'] != nil and params['daacs'] != ''
      query = query != '' ? "#{query} and \"Published\" = 1" : "\"Published\" = 1"
    end
    @display_fields = ["ProjectName", "Context", "ArtifactID", "Quantity", "Form", "Ware", "CeramicGenre", "ArtifactType"]
    @category = ''
    @category_values = ''
    query = query != '' ? "where (#{query}) AND \"z\".\"ImageFileLocation\" IS NOT NULL" : 'AND "z"."ImageFileLocation" IS NOT NULL'
    query = query_image_one(query)
    @images = QueryOneImage.find_by_sql(query)
    
      @total = @images.size
      if params[:all] == nil
        # byebug
        @images = Kaminari.paginate_array(@images).page(@page).per(@per_page)
      end
    respond_to do |format|
      format.html {render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end
  
  def query_two_image_results
    @page_title = 'IQ2'
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = params['sites'].map {|p| "\"ProjectID\" = '#{p}'" }.join(" OR ")
    end
    if params['daacs'] != nil and params['daacs'] != ''
      query = query != '' ? "#{query} and \"Published\" = 1" : "\"Published\" = 1"
    end
    @display_fields = ["ProjectName", "ImageID", "ImageType", "ImageSubtype", "ImageMaterial", "ArtifactForm", "ImageDescription", "CatalogueNumber", "DocumentID", "ImageFileFormat", "ImageCitation"]
    @category = ''
    @category_values = ''
    if params[:types] != nil and params[:types] != ''
      @category = 'Image Type'
      @category_values = params['types'] != nil ? params['types'].join(', ') : ''
      query2 = ''
      query2 = params['types'].map {|p| "\"ImageType\" = '#{p.gsub("'","''")}'" }.join(" OR ") if params['types'] != nil
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"
    elsif params[:subtypes] != nil and params[:subtypes] != ''
      @category = 'Image Subtype'
      @category_values = params['subtypes'] != nil ? params['subtypes'].join(', ') : ''
      query2 = ''
      query3 = ''
      query2 = params['subtypes'].map {|p| "\"ImageSubtype\" = '#{p.gsub("'","''")}'" }.join(" OR ") if params['subtypes'] != nil
      # byebug
      if params[:forms] != nil and params[:forms] != ''
        @category = 'Image Form'
        @category_values = params['forms'] != nil ? params['forms'].join(', ') : ''
        query3 = params['forms'].map {|p| "\"ArtifactForm\" = '#{p.gsub("'","''")}'" }.join(" OR ")
      end
      query = query != '' ? "(#{query})" : ''
      query = query2 != '' ? "#{query} and (#{query2})" : "#{query}"
      query = query3 != '' ? "#{query} and (#{query3})" : "#{query}"
    end
      
    if params[:all] == nil
        @images = QueryTwoImage.where(query).page(@page).per(@per_page)
        @total = QueryTwoImage.where(query).count()
      else
        @images = QueryTwoImage.where(query)
      end
    respond_to do |format|
      format.html {render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end
  

  def search_two
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = params['sites'].map {|p| "\"ProjectID\" = '#{p}'" }.join(" OR ")
    end
    @beads = QueryOneBead.find_by_sql('select "ProjectName", "ArtifactType", \'Bead\' as "Category", sum("Quantity") as "Quantity" from query_one_beads where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    @buckles = QueryOneBuckle.find_by_sql('select "ProjectName", "ArtifactType", \'Buckle\' as "Category", sum("Quantity") as "Quantity" from query_one_buckles where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    @buttons = QueryOneButton.find_by_sql('select "ProjectName", "ArtifactType", \'Button\' as "Category", sum("Quantity") as "Quantity" from query_one_buttons where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    @ceramics = QueryOneCeramic.find_by_sql('select "ProjectName", "ArtifactType", \'Ceramic\' as "Category", sum("Quantity") as "Quantity" from query_one_ceramics where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    @gen_artifacts = QueryOneGenArtifact.find_by_sql('select "ProjectName", "ArtifactType", \'All Other Artifacts\' as "Category", sum("Quantity") as "Quantity" from query_one_gen_artifacts where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    @glasses = QueryOneGlass.find_by_sql('select "ProjectName", "ArtifactType", \'Glass\' as "Category", sum("Quantity") as "Quantity" from query_one_glasses where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    @utensils = QueryOneUtensil.find_by_sql('select "ProjectName", "ArtifactType", \'Utensil\' as "Category", sum("Quantity") as "Quantity" from query_one_utensils where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    @pipes = QueryOneTobaccoPipe.find_by_sql('select "ProjectName", "ArtifactType", \'Tobacco Pipe\' as "Category", sum("Quantity") as "Quantity" from query_one_tobacco_pipes where '+query+' group by "ProjectName", "ArtifactType", "Category" order by "ProjectName","ArtifactType"')
    @bones = QueryOneBone.find_by_sql('select "ProjectName", \'\' as "ArtifactType", \'Faunal\' as "Category", sum("Quantity") as "Quantity" from query_one_bones where '+query+' group by "ProjectName" order by "ProjectName"')
    @artifacts = @beads | @buckles | @buttons | @ceramics | @glasses | @utensils | @pipes | @bones | @gen_artifacts 
    @total = @artifacts.size 
    @artifacts = Kaminari.paginate_array(@artifacts).page(@page).per(@per_page)
    
    respond_to do |format|
      format.html {render :layout => 'application'}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end
  
  def search
    # debugger
    @results = []
    sites = []
    projects_str = ''
    contexts_str = ''
    feature_numbers_str = ''
    phase_str = ''
    strat_group_str = ''
    feature_types_str = ''
    unit_types_str = ''
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      projects_str = params['sites'].map {|p| "search_fields.\"ProjectID\" = '#{p}'" }.join(" OR ")
      # projects_str = params['sites'].map {|p| "\"tblProject\".\"ProjectID\" = '#{p}'" }.join(" OR ")
    end
    if params['context'] != nil
      contexts_str = params['context'].split("\r\n").map {|p| "search_fields.\"Context\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      # contexts_str = params['context'].split("\r\n").map {|p| "\"tblContext\".\"Context\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
    end
    if params['feature_number'] != nil
      feature_numbers_str = params['feature_number'].split("\r\n").map {|p| "search_fields.\"FeatureNumber\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
      # feature_numbers_str = params['feature_number'].split("\r\n").map {|p| "\"tblContext\".\"FeatureNumber\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
    end
    if params['phase'] != nil
      phase_str = params['phase'].split("\r\n").map {|p| "search_fields.\"DAACSPhase\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
    end
    if params['strat_group'] != nil
      strat_group_str = params['strat_group'].split("\r\n").map {|p| "search_fields.\"DAACSStratigraphicGroup\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
    end
    if params['feature_types'] != nil
      feature_types_str = params['feature_types'].map {|p| "search_fields.\"FeatureTypeID\" = '#{p}'" }.join(" OR ")
    end
    if params['unit_types'] != nil
      unit_types_str = params['unit_types'].map {|p| "search_fields.\"UnitTypeID\" = '#{p}'" }.join(" OR ")
    end
    
    query = "(#{projects_str})"
    if contexts_str != ''
      query = "#{query} and (#{contexts_str})"
    end
    if feature_numbers_str != ''
      query = "#{query} and (#{feature_numbers_str})"
    end
    if phase_str != ''
      query = "#{query} and (#{phase_str})"
    end
    if strat_group_str != ''
      query = "#{query} and (#{strat_group_str})"
    end
    if feature_types_str != ''
      query = "#{query} and (#{feature_types_str})"
    end
    if unit_types_str != ''
      query = "#{query} and (#{unit_types_str})"
    end
    if params['bead_fields'] != nil
      @per_page = params[:per_page] || 25
      @page = params[:page] || 1
      params[:query] = '' if params[:query] == 'Search'
      # if current_user.user_level >= 3
      @total = 0
      if params[:all] == nil
        # @total = Bead.includes(:project, :context).where(query).count
        @total = Bead.joins(:search_field).where(query).count
        @total_pages = @total / @per_page.to_i + 1
        @beads = Bead.includes(:search_field).where(query).references(:search_field).order('"tblBead"."ArtifactID"').page(params[:page]).per(@per_page)
        # @beads = Bead.includes(:project, :context  ).where(query).references(:project, :context).order('"tblBead"."ArtifactID"').page(params[:page]).per(@per_page)
      else
        # @beads = Bead.includes(:project, :context).where(query).references(:project, :context).order('"tblBead"."ArtifactID"')
        @beads = Bead.includes(:search_field).where(query).references(:search_field).order('"tblBead"."ArtifactID"')
        
      end
    end
    if params['buckle_fields'] != nil
      @per_page = params[:per_page] || 25
      @page = params[:page] || 1
      params[:query] = '' if params[:query] == 'Search'
      # if current_user.user_level >= 3
      @total = 0
      if params[:all] == nil
        @total = Buckle.joins(:search_field).where(query).count
        @total_pages = @total / @per_page.to_i + 1
        @buckles = Buckle.includes(:search_field).where(query).references(:search_field).order('"tblBuckle"."ArtifactID"').page(params[:page]).per(@per_page)
      else
        @buckles = Buckle.includes(:search_field).where(query).references(:search_field).order('"tblBuckle"."ArtifactID"')
        
      end
    end

    if params['button_fields'] != nil
      @per_page = params[:per_page] || 25
      @page = params[:page] || 1
      params[:query] = '' if params[:query] == 'Search'
      # if current_user.user_level >= 3
      @total = 0
      if params[:all] == nil
        @total = Button.joins(:search_field).where(query).count
        @total_pages = @total / @per_page.to_i + 1
        @buttons = Button.includes(:search_field).where(query).references(:search_field).order('"tblButton"."ArtifactID"').page(params[:page]).per(@per_page)
      else
        @buttons = Button.includes(:search_field).where(query).references(:search_field).order('"tblBuckle"."ArtifactID"')
        
      end
    end
    # debugger
    
    respond_to do |format|
      format.html {render :layout => ((params[:daacs] == nil or params[:daacs] == '') ? 'application' : 'daacs_query')}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
  end

  def search_context_one
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    puts "=================== page=#{params[:page]}"
    if params['sites'] != nil
      query = params['sites'].map {|p| "\"ProjectID\" = '#{p}'" }.join(" OR ")
    end
    if params[:all] == nil
      @total = Context.where(query).count
      @total_pages = @total / @per_page.to_i + 1
      @contexts = ContextWithProjectName.where(query).order('"ProjectName"', '"Context"').page(@page).per(@per_page)
    end
      
    respond_to do |format|
      format.html {render :layout => 'application'}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end

  def search_faunal_one
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    puts "=================== page=#{params[:page]}"
    if params['sites'] != nil
      query = params['sites'].map {|p| "\"ProjectID\" = '#{p}'" }.join(" OR ")
    end
    @total = FaunalQueryOne.where(query).count
    if params[:all] == nil
      @total_pages = @total / @per_page.to_i + 1
      @bones = FaunalQueryOne.where(query).order('"ProjectName"', '"TaxonEnglish"').page(@page).per(@per_page)
    else
      @bones = FaunalQueryOne.where(query)
    end
      
    respond_to do |format|
      format.html {render :layout => 'application'}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end

  def search_faunal_context
    # debugger
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    contexts_str = ''
    if params['context'] != nil
      contexts_str = params['context'].split("\r\n").map {|p| "\"\"\"Context\"\"\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
    end
    puts "=================== page=#{params[:page]}"
    if params['sites'] != nil
      query = params['sites'].map {|p| "\"\"\"ProjecID\"\"\" = '#{p}'" }.join(" OR ")
    end
    if contexts_str != ''
      query = "#{contexts_str} and (#{query})"
    end
    @total = FaunalQueryContext.where(query).count
    if params[:all] == nil
      @total_pages = @total / @per_page.to_i + 1
      @bones = FaunalQueryContext.where(query).page(@page).per(@per_page)
    else
      @bones = FaunalQueryContext.where(query)
    end
      
    respond_to do |format|
      format.html {render :layout => 'application'}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
        render :action => 'search_faunal_xls'
      }
    end
    
  end

  def search_faunal_feature_type
    # debugger
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    contexts_str = ''
    if params['feature_types'] != nil
      contexts_str = params['feature_types'].map {|p| "\"\"\"FeatureType\"\"\" ilike '#{p.gsub('*','%')}'" }.join(" OR ")
    end
    puts "=================== page=#{params[:page]}"
    if params['sites'] != nil
      query = params['sites'].map {|p| "\"\"\"ProjecID\"\"\" = '#{p}'" }.join(" OR ")
    end
    if contexts_str != ''
      query = "#{contexts_str} and (#{query})"
    end
    @total = FaunalQueryFeatureType.where(query).count
    if params[:all] == nil
      @total_pages = @total / @per_page.to_i + 1
      @bones = FaunalQueryFeatureType.where(query).page(@page).per(@per_page)
    else
      @bones = FaunalQueryFeatureType.where(query)
    end
      
    respond_to do |format|
      format.html {render :layout => 'application'}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
        render :action => 'search_faunal_xls'
      }
    end
    
  end

  def image_forms
    results = []
    sub_types = []
    if params[:sub_types] != nil
      params[:sub_types].split('_').each do |st|
        sub_types += ImageSubtype.where(:ImageSubtype => st).map{|o| o.id}
      end
    end
    sub_types.each do |st|
      results += ImageForm.where(:ImageSubtypeID => st).map{|o| o.ImageForm }
    end
    results = results.uniq.sort
    render :json => results.to_json
  end
  
  def image_search
    render :layout => 'application'
  end

  def image_search_action
    @per_page = params[:per_page] || 25
    @page = params[:page] || 1
    query = "\"ProjectID\" is not null"
    
    if params['sites'] != nil
      query = params['sites'].map {|p| "\"tblProject\".\"ProjectID\" = '#{p}'" }.join(" OR ")
    end
    @images = Image.joins(:projects).where(query).references(:projects).order('"DateAdded" desc' )
    @total = @images.size 
    if params[:all] == nil
      @images = Kaminari.paginate_array(@images).page(@page).per(@per_page)
    end
      
    respond_to do |format|
      format.html {render 'images/index', :layout => 'application'}
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename=search.xls'
      }
    end
    
  end

  def activities
    range = Time.now - 365.days
    case params[:range]
    when 'Past 6 months'
      range = Time.now - 180.days
    when 'Past month'
      range = Time.now - 31.days
    when 'Past week'
      range = Time.now - 7.days
    when 'Yesterday'
      range = Time.now - 1.days
    end
    if params[:user] != nil and params[:user] != '' and params[:user] != 'null'
      @gen_artifacts = Activity.where("controller = 'gen_artifacts' and created_at > ? and user_id = ?", range, params[:user])
      @ceramics = Activity.where("controller = 'ceramics' and created_at > ? and user_id = ?", range, params[:user])
      @glasses = Activity.where("controller = 'glasses' and created_at > ? and user_id = ?", range, params[:user])
      @beads = Activity.where("controller = 'beads' and created_at > ? and user_id = ?", range, params[:user])
      @buckles = Activity.where("controller = 'buckles' and created_at > ? and user_id = ?", range, params[:user])
      @bones = Activity.where("controller = 'bones' and created_at > ? and user_id = ?", range, params[:user])
      @tobacco_pipes = Activity.where("controller = 'tobacco_pipes' and created_at > ? and user_id = ?", range, params[:user])
      @utensils = Activity.where("controller = 'utensils' and created_at > ? and user_id = ?", range, params[:user])
      @buttons = Activity.where("controller = 'buttons' and created_at > ? and user_id = ?", range, params[:user])
      @contexts = Activity.where("controller = 'contexts' and created_at > ? and user_id = ?", range, params[:user])
      @features = Activity.where("controller = 'context_features' and created_at > ? and user_id = ?", range, params[:user])
    else
      @gen_artifacts = Activity.where("controller = 'gen_artifacts' and created_at > ?", range)
      @ceramics = Activity.where("controller = 'ceramics' and created_at > ?", range)
      @glasses = Activity.where("controller = 'glasses' and created_at > ?", range)
      @beads = Activity.where("controller = 'beads' and created_at > ?", range)
      @buckles = Activity.where("controller = 'buckles' and created_at > ?", range)
      @bones = Activity.where("controller = 'bones' and created_at > ?", range)
      @tobacco_pipes = Activity.where("controller = 'tobacco_pipes' and created_at > ?", range)
      @utensils = Activity.where("controller = 'utensils' and created_at > ?", range)
      @buttons = Activity.where("controller = 'buttons' and created_at > ?", range)
      @contexts = Activity.where("controller = 'contexts' and created_at > ?", range)
      @features = Activity.where("controller = 'context_features' and created_at > ?", range)
    end
    # debugger
    respond_to do |format|
      format.js
      format.html {render :text => 'success'}
    end
  end
  
  def create_message
    current_user.send_message(User.all, params[:body], "#{params[:subject]}", true, params[:attachment])
    respond_to do |format|
      format.js
      format.html {redirect_to :action => 'dashboard'}
    end
  end

  def display_message
    @message = current_user.mailbox.conversations.find(params[:id])
    @message.mark_as_read current_user
    headers['Last-Modified'] = Time.now.httpdate
    respond_to do |format|
      format.js
    end
  end

  def all_messages
    respond_to do |format|
      format.js
    end
  end

  def date_sort_descending
    respond_to do |format|
      format.js
    end
  end

  def date_sort_ascending
    respond_to do |format|
      format.js
    end
  end

  def from_sort_descending
    respond_to do |format|
      format.js
    end
  end

  def from_sort_ascending
    respond_to do |format|
      format.js
    end
  end

  def subject_sort_descending
    respond_to do |format|
      format.js
    end
  end

  def subject_sort_ascending
    respond_to do |format|
      format.js
    end
  end

  private

    def allow_daacs_iframe
      response.headers['X-Frame-Options'] = 'ALLOW-FROM https://apps.daacs.org'
    end

end
