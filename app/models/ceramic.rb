class Ceramic < ActiveRecord::Base
  # after_create :set_artifact_id
  before_create :update_data
  before_save :set_artifact_id
  before_save :update_timestamps
  
  self.table_name = 'tblCeramic'
  self.primary_key = 'GenerateContextArtifactID'
  # #attr_accessible :title, :body
  belongs_to :decoration_yes_no, :class_name => 'YesNo', :foreign_key => 'DecorationYN'  
  belongs_to :ceramic_material, :foreign_key => 'CeramicMaterialID'
  belongs_to :ceramic_manu_tech, :foreign_key => 'CeramicManuTechID'
  belongs_to :ceramic_ware, :foreign_key => 'WareID'
  belongs_to :ceramic_vessel_category , :foreign_key => 'CeramicVesselCategoryID'
  belongs_to :ceramic_form, :foreign_key => 'CeramicFormID'
  belongs_to :mended_form, :class_name => 'CeramicForm', :foreign_key => 'MendedFormID'
  belongs_to :ceramic_completeness, :foreign_key => 'CeramicCompletenessID'
  belongs_to :paste_sediment_color, :class_name => "SedimentColor", :foreign_key => "PasteSedimentColorID"
  belongs_to :exterior_glaze, :class_name => 'CeramicGlaze', :foreign_key => 'ExteriorGlazeID'
  belongs_to :exterior_mun_app_color, :class_name => 'MunsellAppliedColor', :foreign_key => 'ExteriorMunAppColorID'
  belongs_to :interior_glaze, :class_name => 'CeramicGlaze', :foreign_key => 'InteriorGlazeID'
  belongs_to :interior_mun_app_color, :class_name => 'MunsellAppliedColor', :foreign_key => 'InteriorMunAppColorID'
  belongs_to :oxidized_versus_reduced, :class_name => 'CeramicOxidized', :foreign_key => 'OxidizedVersusReducedID'
  belongs_to :evidenceof_burning, :class_name => 'CeramicBurning', :foreign_key => 'EvidenceofBurningID'
  belongs_to :mended_yes_no, :class_name => 'Mended', :foreign_key => 'MendedYNID'
  belongs_to :pmm_yes_no, :class_name => 'YesNo', :foreign_key => 'PMM'
  belongs_to :ceramic_genre, :foreign_key => 'CeramicGenreID'
  belongs_to :base_mark, :class_name => 'CeramicBaseMark', :foreign_key => 'BaseMarkID'
  # belongs_to :base_mun_app_color, :class_name => 'MunsellAppliedColor', :foreign_key => 'BaseMunAppColorID'
  belongs_to :acdistance, :foreign_key => 'ACDistance'
  belongs_to :created_by, :class_name => 'Editor', :foreign_key => 'EditorIDN'
  belongs_to :updated_by, :class_name => 'Editor', :foreign_key => 'EditorID'
  belongs_to :rim_form, :class_name => 'CeramicRimForm', :foreign_key => 'RimFormID'
  belongs_to :rim_angle, :class_name => 'CeramicRimAngle', :foreign_key => 'RimAngleID'
  belongs_to :ceramic_paste_inclusion_density, :foreign_key => 'PasteInclusionDensityID'
  belongs_to :ceramic_pattern_name, :foreign_key => 'PatternNameID'
  belongs_to :ceramic_cewbase_form, :foreign_key => 'CeramicCEWBaseFormID'
  belongs_to :ceramic_cewfootring_form, :foreign_key => 'CeramicCEWFootringFormID'
  belongs_to :ceramic_cewtype, :foreign_key => 'CeramicCEWTypeID'
  belongs_to :ceramic_cewdec_mode, :foreign_key => 'CeramicCEWDecModeID'
  belongs_to :exterior_glaze_opacity, :class_name => 'CeramicGlazeOpacity', :foreign_key => 'ExteriorGlazeOpacityID'
  belongs_to :interior_glaze_opacity, :class_name => 'CeramicGlazeOpacity', :foreign_key => 'InteriorGlazeOpacityID'
  belongs_to :generate_context_artifact, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  has_one :context_sample, :through => :generate_context_artifact, :foreign_key => 'ContextSampleID'
  has_one :context, :through => :context_sample, :foreign_key => 'ContextID'
  has_one :project, :through => :context, :foreign_key => 'ProjectID'
  # delegate :context_sample, :to => :generate_context_artifact
  # delegate :context, :to => :context_sample
  # delegate :project, :to => :context
  has_many :ceramic_dec_techs, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  has_many :ceramic_use_wears, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  has_many :ceramic_colono_thicknesses, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  has_many :ceramic_mends, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  has_many :ceramic_paste_inclusions, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy

  has_many :artifact_images, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :artifact_images, :allow_destroy => true

  has_many :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :gen_object_artifacts, :allow_destroy => true

  validates :SherdThickness, numericality: true, allow_nil: true
  validates :MaximumSherdMeasurement, numericality: true, allow_nil: true
  validates :SherdWeight, numericality: true, allow_nil: true
  validates :MendedSherdWeight, numericality: true, allow_nil: true
  validates :RimLength, numericality: true, allow_nil: true
  validates :RimDiameter, numericality: true, allow_nil: true
  validates :MendedRimDiameter, numericality: true, allow_nil: true
  validates :BaseLength, numericality: true, allow_nil: true
  validates :BaseDiameter, numericality: true, allow_nil: true
  validates :MendedBaseDiameter, numericality: true, allow_nil: true
  validates :MaxRimWidth, numericality: true, allow_nil: true
  validates :Quantity, numericality: { only_integer: true }
  
  validates_presence_of :WareID
  
  validate :check_sherd_thickness
  
  accepts_nested_attributes_for :ceramic_dec_techs, :allow_destroy => true
  accepts_nested_attributes_for :ceramic_use_wears, :allow_destroy => true
  accepts_nested_attributes_for :ceramic_paste_inclusions, :allow_destroy => true
  accepts_nested_attributes_for :ceramic_colono_thicknesses, :allow_destroy => true
  accepts_nested_attributes_for :ceramic_mends, :allow_destroy => true

  after_save :set_child_artifact_ids

  def set_child_artifact_ids
    self.ceramic_use_wears.each do |bc|
      bc.ArtifactID = self.ArtifactID
      bc.save
    end
    self.ceramic_dec_techs.each do |bc|
      bc.ArtifactID = self.ArtifactID
      bc.save
    end
    self.ceramic_paste_inclusions.each do |bc|
      bc.ArtifactID = self.ArtifactID
      bc.save
    end
    self.ceramic_colono_thicknesses.each do |bc|
      bc.ArtifactID = self.ArtifactID
      bc.save
    end
  end
  
  def check_sherd_thickness
    if ((self.MaximumSherdMeasurement != nil) and (!((self.MaximumSherdMeasurement.to_i % 5) == 0 )))
      errors.add('MaximumSherdMeasurement', 'must be divisible by 5') 
    end
  end
  
  def self.in_projects(ids)
    str = ids.map { |t| "project.ProjectID = '#{t.id}'" }.join(" OR ")
  end
  
  def set_artifact_id
    self.ArtifactID = self.generate_context_artifact.ArtifactID if self.generate_context_artifact != nil
    self.gen_object_artifacts.each do |obj|
      obj.ArtifactID = self.ArtifactID
      obj.save
    end
  end
  
  def update_data
    self.generate_context_artifact.set_artifact_id
    # don't cache !!!
    self.ArtifactID = GenerateContextArtifact.find(self.generate_context_artifact.id).ArtifactID if self.generate_context_artifact != nil
    # self.ArtifactID = self.generate_context_artifact.ArtifactID if self.generate_context_artifact != nil
    self.DateAdded = Time.now    
    # self.DateChanged = Time.now
    # self.save
  end
  def update_timestamps
    self.DateChanged = Time.now
  end
end

