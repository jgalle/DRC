class TobaccoPipe < ActiveRecord::Base
  self.table_name = 'tblTobaccoPipe'
  self.primary_key = 'GenerateContextArtifactID'
  
  belongs_to :tobacco_pipe_completeness, :foreign_key => 'TobaccoPipeCompletenessID'
  belongs_to :tobacco_pipe_material, :foreign_key => 'TobaccoPipeMaterialID'
  belongs_to :munsell_applied_color, :foreign_key => 'MunAppColorID'
  belongs_to :paste_inclusion, :foreign_key => 'PasteInclusionID'
  belongs_to :tobacco_pipe_manu_tech, :foreign_key => 'TobaccoPipeManuTechID'
  belongs_to :tobacco_pipe_glaze_type, :foreign_key => 'GlazeTypeID'
  belongs_to :sediment_color, :foreign_key => 'MunSedColorID'
  belongs_to :pmm_yes_no, :class_name => 'YesNo', :foreign_key => 'PMM'
  belongs_to :tobacco_pipe_bowl_form, :foreign_key => 'BowlFormID'
  belongs_to :tobacco_pipe_bowl_base_type, :foreign_key => 'BowlBaseTypeID'
  belongs_to :tobacco_pipe_mouthpiece_form, :foreign_key => 'MouthpieceFormID'
  belongs_to :mended_yes_no, :class_name => 'Mended', :foreign_key => 'MendedYNID'
  belongs_to :generate_context_artifact, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  belongs_to :created_by, :class_name => 'Editor', :foreign_key => 'EditorIDN'
  belongs_to :updated_by, :class_name => 'Editor', :foreign_key => 'EditorID'
  belongs_to :decoration_yes_no, :class_name => 'YesNo', :foreign_key => 'DecorationYN'  
  has_many :tobacco_pipe_decorations, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  has_many :tobacco_pipe_text_marks, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  
  has_one :context_sample, :through => :generate_context_artifact, :foreign_key => 'ContextSampleID'
  has_one :context, :through => :context_sample, :foreign_key => 'ContextID'
  has_one :project, :through => :context, :foreign_key => 'ProjectID'
  
  has_many :artifact_images, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :artifact_images, :allow_destroy => true

  has_many :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :gen_object_artifacts, :allow_destroy => true

  #attr_accessible :quantity
  accepts_nested_attributes_for :tobacco_pipe_decorations, :allow_destroy => true
  accepts_nested_attributes_for :tobacco_pipe_text_marks, :allow_destroy => true
  
  validates :StemLength, numericality: true, allow_nil: true
  validates :ExteriorStemDiameter, numericality: true, allow_nil: true
  validates :MetricBoreDiameter, numericality: true, allow_nil: true
  validates :BoreDiameter64ths, numericality: true, allow_nil: true
  validates :BowlHeight, numericality: true, allow_nil: true
  validates :MaximumBowlDiameter, numericality: true, allow_nil: true
  validates :BowlRimDiameter, numericality: true, allow_nil: true
  validates :BowlVolume, numericality: true, allow_nil: true
  validates :MaximumSherdMeasurement, numericality: true, allow_nil: true
  validates :Weight, numericality: true, allow_nil: true
  validates :Quantity, numericality: { only_integer: true }
  
   
  before_create :update_data
  before_save :set_artifact_id
  before_save :update_timestamps
  after_save :set_child_artifact_ids

  def set_child_artifact_ids
    self.tobacco_pipe_decorations.each do |bc|
      bc.ArtifactID = self.ArtifactID
      bc.save
    end
    self.tobacco_pipe_text_marks.each do |bc|
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
  
end
