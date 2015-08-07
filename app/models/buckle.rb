class Buckle < ActiveRecord::Base
  self.table_name = 'tblBuckle'
  self.primary_key = 'GenerateContextArtifactID'
  
  belongs_to :buckle_type, :foreign_key => 'BuckleTypeID'
  belongs_to :buckle_completeness, :foreign_key => 'BuckleCompletenessID'
  belongs_to :buckle_frame_plating, :foreign_key => 'FramePlatingID'
  belongs_to :generate_context_artifact, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  belongs_to :burned_yes_no, :class_name => 'YesNo', :foreign_key => 'Burned'
  belongs_to :mended_yes_no, :class_name => 'YesNo', :foreign_key => 'Mended'
  belongs_to :mended, :foreign_key => 'MendedYNID'
  belongs_to :pmm_yes_no, :class_name => 'YesNo', :foreign_key => 'PMM'
  belongs_to :created_by, :class_name => 'Editor', :foreign_key => 'EditorIDN'
  belongs_to :updated_by, :class_name => 'Editor', :foreign_key => 'EditorID'
  belongs_to :decoration_yes_no, :class_name => 'YesNo', :foreign_key => 'Mended'
  has_many :buckle_dec_techs, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  has_many :buckle_forms, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  
  has_one :context_sample, :through => :generate_context_artifact, :foreign_key => 'ContextSampleID'
  has_one :context, :through => :context_sample, :foreign_key => 'ContextID'
  has_one :project, :through => :context, :foreign_key => 'ProjectID'
  
  accepts_nested_attributes_for :buckle_dec_techs, :allow_destroy => true
  accepts_nested_attributes_for :buckle_forms, :allow_destroy => true
  
  validates :Weight, numericality: true, allow_nil: true
  validates :Quantity, numericality: { only_integer: true }
  
  has_many :artifact_images, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :artifact_images, :allow_destroy => true
  
  has_many :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :gen_object_artifacts, :allow_destroy => true
  
  has_one :search_field, :foreign_key => 'GenerateContextArtifactID'
  
  before_create :update_data
  before_save :set_artifact_id
  before_save :update_timestamps
  after_save :set_child_artifact_ids

  def set_child_artifact_ids
    self.buckle_forms.each do |bc|
      bc.ArtifactID = self.ArtifactID
      bc.save
    end
    self.buckle_dec_techs.each do |bc|
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
  
  # #attr_accessible :article_id
end
