class Button < ActiveRecord::Base
  self.table_name = 'tblButton'
  self.primary_key = 'GenerateContextArtifactID'
  
  belongs_to :completeness, :foreign_key => 'ConmpletenessID'
  belongs_to :button_manu_tech, :foreign_key => 'ButtonManuTechID'
  belongs_to :button_type, :foreign_key => 'ButtonTypeID'
  belongs_to :button_face_material, :class_name => 'ButtonMaterial', :foreign_key => 'ButtonFaceMaterialID'
  belongs_to :button_material, :foreign_key => 'ButtonMaterialID'
  belongs_to :button_basic_color, :class_name => 'BasicColor', :foreign_key => 'ButtonBasicColorID'
  belongs_to :button_eye, :foreign_key => 'EyeID'
  belongs_to :button_shank_style, :foreign_key => 'ShankStyleID'
  belongs_to :button_shank_material, :foreign_key => 'ShankMaterialID'
  belongs_to :button_shank_condition, :foreign_key => 'ShankConditionID'
  belongs_to :button_shape, :foreign_key => 'ButtonShapeID'
  belongs_to :button_metal_color, :foreign_key => 'ButtonMetalColorID'
  belongs_to :burned_yes_no, :class_name => 'YesNo', :foreign_key => 'Burned'
  belongs_to :pmm_yes_no, :class_name => 'YesNo', :foreign_key => 'PMM'
  belongs_to :button_face_manu_tech, :class_name => 'ButtonManuTech', :foreign_key => 'ButtonFaceManuTechID'
  belongs_to :button_face_material, :class_name => 'ButtonMaterial', :foreign_key => 'ButtonFaceMaterialID'
  belongs_to :button_join_method, :foreign_key => 'ButtonJoinMethodID'
  belongs_to :generate_context_artifact, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  belongs_to :created_by, :class_name => 'Editor', :foreign_key => 'editorIDN'
  belongs_to :updated_by, :class_name => 'Editor', :foreign_key => 'editorID'
  has_many :button_dec_techs, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :mended, :foreign_key => 'MendedYNID'
  
  accepts_nested_attributes_for :button_dec_techs, :allow_destroy => true
  
  has_one :context_sample, :through => :generate_context_artifact, :foreign_key => 'ContextSampleID'
  has_one :context, :through => :context_sample, :foreign_key => 'ContextID'
  has_one :project, :through => :context, :foreign_key => 'ProjectID'
  
  has_many :artifact_images, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :artifact_images, :allow_destroy => true
  
  has_many :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :gen_object_artifacts, :allow_destroy => true
  
  has_one :search_field, :foreign_key => 'GenerateContextArtifactID'
  
  validates :Weight, numericality: true, allow_nil: true
  validates :Height, numericality: true, allow_nil: true
  validates :Diameter, numericality: true, allow_nil: true
  validates :Length, numericality: true, allow_nil: true
  validates :Width, numericality: true, allow_nil: true
  validates :Quantity, numericality: { only_integer: true }
  
  before_create :update_data
  before_save :set_artifact_id
  before_save :update_timestamps
  after_save :set_child_artifact_ids

  def set_child_artifact_ids
    # self.button_casings.each do |bc|
    #   bc.ArtifactID = self.ArtifactID
    #   bc.save
    # end
    # self.button_dec_techs.each do |bc|
    #   bc.ArtifactID = self.ArtifactID
    #   bc.save
    # end
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
  # #attr_accessible :artifact_id
end
