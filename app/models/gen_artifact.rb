class GenArtifact < ActiveRecord::Base
  self.table_name = 'tblGenArtifact'
  self.primary_key = 'GenerateContextArtifactID'
  
  belongs_to :gen_artifact_form, :foreign_key => 'GenArtifactFormID'
  belongs_to :gen_artifact_category, :foreign_key => 'GenArtifactCategoryID'
  belongs_to :gen_artifact_completeness, :foreign_key => 'GenArtifactCompletenessID'
  # belongs_to :mended_yes_no, :class_name => 'YesNo', :foreign_key => 'Mended'
  belongs_to :mended, :foreign_key => 'MendedYNID'
  belongs_to :decoration_yes_no, :class_name => 'YesNo', :foreign_key => 'DecorationYN'
  belongs_to :pmm_yes_no, :class_name => 'YesNo', :foreign_key => 'PMM'
  belongs_to :gen_artifact_nail_head, :foreign_key => 'NailHeadTypeID'
  belongs_to :gen_artifact_nail_end, :foreign_key => 'NailEndTypeID'
  belongs_to :gen_artifact_nail_modification, :foreign_key => 'NailModificationID'
  belongs_to :burned_yes_no, :class_name => 'YesNo', :foreign_key => 'Burned'
  belongs_to :gen_artifact_brick_size, :foreign_key => 'BrickSizeID'
  belongs_to :created_by, :class_name => 'Editor', :foreign_key => 'EditorIDN'
  belongs_to :updated_by, :class_name => 'Editor', :foreign_key => 'EditorID'

  belongs_to :generate_context_artifact, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  has_one :context_sample, :through => :generate_context_artifact, :foreign_key => 'ContextSampleID'
  has_one :context, :through => :context_sample, :foreign_key => 'ContextID'
  has_one :project, :through => :context, :foreign_key => 'ProjectID'

  has_many :gen_artifact_dec_techs, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  has_many :gen_artifact_materials, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy

  has_many :artifact_images, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :artifact_images, :allow_destroy => true

  has_many :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :gen_object_artifacts, :allow_destroy => true

  #attr_accessible :artifact_id
  accepts_nested_attributes_for :gen_artifact_dec_techs, :allow_destroy => true
  accepts_nested_attributes_for :gen_artifact_materials, :allow_destroy => true

  validates :Length, numericality: true, allow_nil: true
  validates :Width, numericality: true, allow_nil: true
  validates :Height, numericality: true, allow_nil: true
  validates :Weight, numericality: true, allow_nil: true
  validates :Diameter, numericality: true, allow_nil: true
  validates :Quantity, numericality: { only_integer: true }
  validate :has_material?
  
  def has_material?
    if self.gen_artifact_materials.size < 1 or (self.gen_artifact_materials.first.gen_artifact_material_type == nil or self.gen_artifact_materials.first.gen_artifact_manu_tech == nil)
      errors.add('Materials_Section', 'must have a Material and Manufacturing Technique') 
    end
  end

  before_create :update_data
  before_save :set_artifact_id
  before_save :update_timestamps
  after_save :set_child_artifact_ids

  def set_child_artifact_ids
    self.gen_artifact_materials.each do |bc|
      bc.ArtifactID = self.ArtifactID
      bc.save
    end
    self.gen_artifact_dec_techs.each do |bc|
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
