class Bead < ActiveRecord::Base
  self.table_name = 'tblBead'
  self.primary_key = 'GenerateContextArtifactID'

  belongs_to :completeness, :foreign_key => 'CompletenessID'
  belongs_to :bead_material, :foreign_key => 'BeadMaterialID'
  belongs_to :bead_manu_tech, :foreign_key => 'BeadManuTechID'
  belongs_to :bead_structure, :foreign_key => 'StructureID'
  belongs_to :bead_form, :foreign_key => 'BeadFormID'
  belongs_to :bead_shape, :foreign_key => 'BeadShapeID'
  belongs_to :bead_end_treatment, :foreign_key => 'EndTreatmentID'
  belongs_to :heat_treated_yes_no, :class_name => 'YesNo', :foreign_key => 'HeatTreated'
  belongs_to :basic_color, :foreign_key => 'BeadBasicColorID,'
  belongs_to :bead_diaphaneity, :foreign_key => 'DiaphaneityID'
  belongs_to :pmm, :class_name => 'YesNo', :foreign_key => 'PMM'
  belongs_to :patination, :class_name => 'YesNo', :foreign_key => 'Patination'
  belongs_to :burned, :class_name => 'YesNo', :foreign_key => 'Burned'
  belongs_to :bead_weathered_eroded, :class_name => 'YesNo', :foreign_key => 'BeadWeatheredEroded'
  belongs_to :mended, :foreign_key => 'MendedYNID'
  # belongs_to :mended, :class_name => 'YesNo', :foreign_key => 'Mended'
  belongs_to :bead_kidd_bead_type, :foreign_key => 'KiddBeadTypeID'
  belongs_to :bead_basic_color, :class_name => 'MunsellAppliedColor', :foreign_key => 'MunAppColorID'
  has_many :bead_casings, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  belongs_to :bead_complex_shape, :foreign_key => 'BeadComplexShapeID'
  has_many :bead_dec_techs, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  belongs_to :generate_context_artifact, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  belongs_to :created_by, :class_name => 'Editor', :foreign_key => 'EditorIDN'
  belongs_to :updated_by, :class_name => 'Editor', :foreign_key => 'EditorID'
  
  has_one :context_sample, :through => :generate_context_artifact, :foreign_key => 'ContextSampleID'
  has_one :context, :through => :context_sample, :foreign_key => 'ContextID'
  # has_one :context_features, :through => :context
  scope :context_features, -> (feature_number, project_id) {
    select("\"tblContextFeaure\".* from \"tblContextFeature\" where \"tblContextFeaure\".\"FeatureNumber\"='#{feature_number} and \"tblContextFeaure\".\"ProjectID\"='#{project_id}'")
  }
  has_one :project, :through => :context, :foreign_key => 'ProjectID'
  
  has_one :search_field, :foreign_key => 'GenerateContextArtifactID'
  
  has_and_belongs_to_many :images, :join_table => 'tblArtifactImage', :foreign_key => 'GenerateContextArtifactID', :association_foreign_key => 'ImageID'

  has_many :artifact_images, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :artifact_images, :allow_destroy => true

  has_many :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :gen_object_artifacts, :allow_destroy => true

  accepts_nested_attributes_for :bead_casings, :allow_destroy => true
  accepts_nested_attributes_for :bead_dec_techs, :allow_destroy => true
  
  validates :Weight, numericality: true, allow_nil: true
  validates :Length, numericality: true, allow_nil: true
  validates :Width, numericality: true, allow_nil: true
  validates :Height, numericality: true, allow_nil: true
  validates :SizeofPerforationI, numericality: true, allow_nil: true
  validates :SizeofPerforationII, numericality: true, allow_nil: true
  validates :Quantity, numericality: { only_integer: true }

  before_create :update_data
  before_save :set_artifact_id
  before_save :update_timestamps
  after_save :set_child_artifact_ids

  def set_child_artifact_ids
    self.bead_casings.each do |bc|
      bc.ArtifactID = self.ArtifactID
      bc.save
    end
    self.bead_dec_techs.each do |bc|
      bc.ArtifactID = self.ArtifactID
      bc.save
    end
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
    self.DateAdded = Time.now    
    # self.DateChanged = Time.now    
    # self.save
  end
  def update_timestamps
    self.DateChanged = Time.now
  end
  # #attr_accessible :artifact_id
end
