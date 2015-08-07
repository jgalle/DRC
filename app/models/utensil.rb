class Utensil < ActiveRecord::Base
  self.table_name = 'tblUtensil'
  self.primary_key = 'GenerateContextArtifactID'
  
  belongs_to :completeness, :foreign_key => 'CompletenessID'
  belongs_to :utensil_form, :foreign_key => 'UtensilFormID'
  belongs_to :utensil_plating, :foreign_key => 'UtensilPlatingID'
  belongs_to :utensil_handle_decoration, :foreign_key => 'HandleDecorationID'
  belongs_to :decoration_yes_no, :class_name => 'YesNo', :foreign_key => 'DecorationYN'
  belongs_to :pmm_yes_no, :class_name => 'YesNo', :foreign_key => 'PMM'
  belongs_to :utensil_fork_tine_count, :foreign_key => 'UtensilForkTineCountID'
  belongs_to :spoon_rat_tail, :class_name => 'YesNo', :foreign_key => 'SpoonRatTail'
  belongs_to :burned_yes_no, :class_name => 'YesNo', :foreign_key => 'Burned'
  # belongs_to :mended_yes_no, :class_name => 'YesNo', :foreign_key => 'Mended'
  belongs_to :mended, :foreign_key => 'MendedYNID'
  belongs_to :generate_context_artifact, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  belongs_to :created_by, :class_name => 'Editor', :foreign_key => 'EditorIDN'
  belongs_to :updated_by, :class_name => 'Editor', :foreign_key => 'EditorID'
  has_many :utensil_specifics, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
 
  accepts_nested_attributes_for :utensil_specifics, :allow_destroy => true
  
  has_one :context_sample, :through => :generate_context_artifact, :foreign_key => 'ContextSampleID'
  has_one :context, :through => :context_sample, :foreign_key => 'ContextID'
  has_one :project, :through => :context, :foreign_key => 'ProjectID'

  has_many :artifact_images, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :artifact_images, :allow_destroy => true

  has_many :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :gen_object_artifacts, :allow_destroy => true
  
  validates :ArtifactLength, numericality: true, allow_nil: true
  validates :ArtifactWidth, numericality: true, allow_nil: true
  validates :ArtifactWeight, numericality: true, allow_nil: true
  validates :Quantity, numericality: { only_integer: true }
  
  before_create :update_data
  before_save :set_artifact_id
  before_save :update_timestamps
  after_save :set_child_artifact_ids

  def set_child_artifact_ids
    self.utensil_specifics.each do |bc|
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
  
  #attr_accessible :artifact_id
end
