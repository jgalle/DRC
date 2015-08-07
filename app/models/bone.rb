class Bone < ActiveRecord::Base
  self.table_name = 'tblBone'
  self.primary_key = 'GenerateContextArtifactID'
  
  belongs_to :bone_reliability, :foreign_key => 'ReliabilityID'
  belongs_to :bone_taxon, :foreign_key => 'TaxonID'
  belongs_to :bone_element, :foreign_key => 'BoneElementID'
  belongs_to :bone_symmetry, :foreign_key => 'SymmetryID'
  belongs_to :bone_location, :foreign_key => 'BoneLocationID'
  belongs_to :bone_descriptor, :foreign_key => 'DescriptorID'
  belongs_to :bone_fusion, :foreign_key => 'FusionID'
  belongs_to :bone_tooth_type, :foreign_key => 'ToothTypeID'
  belongs_to :bone_tooth_wear, :foreign_key => 'ToothWearID'
  belongs_to :bone_size, :foreign_key => 'BoneSizeID'
  belongs_to :bone_sex, :foreign_key => 'SexID'
  belongs_to :disease, :class_name => 'BoneYesNoProbably', :foreign_key => 'ReliabilityID'
  belongs_to :weathered, :class_name => 'BoneYesNoProbably', :foreign_key => 'ReliabilityID'
  belongs_to :burned_yes_no, :class_name => 'BoneYesNoProbably', :foreign_key => 'Burned'
  belongs_to :bone_reliability, :foreign_key => 'ReliabilityID'
  belongs_to :bone_condition, :foreign_key => 'BoneConditionID'
  belongs_to :bone_chew_type, :foreign_key => 'ChewTypeID'
  belongs_to :bone_chew_location, :foreign_key => 'ChewLocationID'
  belongs_to :fresh_break_yes_no, :class_name => 'BoneYesNoProbably', :foreign_key => 'FreshBreak'
  belongs_to :bone_butcher_method, :foreign_key => 'ButcherMethodID'
  belongs_to :bone_butcher_location, :foreign_key => 'ButcherLocationID'
  belongs_to :bone_butcher_direction, :foreign_key => 'ButcherDirectionID'
  belongs_to :bone_mark_type, :foreign_key => 'BoneMarkTypeID'
  belongs_to :bone_mark_direction, :foreign_key => 'MarkDirectionID'
  belongs_to :bone_mark_location, :foreign_key => 'BoneMarkLocationID'
  belongs_to :generate_context_artifact, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  belongs_to :created_by, :class_name => 'Editor', :foreign_key => 'EditorIDN'
  belongs_to :updated_by, :class_name => 'Editor', :foreign_key => 'EditorID'

  has_one :context_sample, :through => :generate_context_artifact, :foreign_key => 'ContextSampleID'
  has_one :context, :through => :context_sample, :foreign_key => 'ContextID'
  has_one :project, :through => :context, :foreign_key => 'ProjectID'

  has_many :bone_measures, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy

  validates :Weight, numericality: true, allow_nil: true
  validates :Quantity, numericality: { only_integer: true }

  accepts_nested_attributes_for :bone_measures, :allow_destroy => true

  has_many :artifact_images, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :artifact_images, :allow_destroy => true

  has_many :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :gen_object_artifacts, :allow_destroy => true

  before_create :update_data
  before_save :set_artifact_id
  before_save :update_timestamps
  after_save :set_child_artifact_ids

  def set_child_artifact_ids
    self.bone_measures.each do |bc|
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
