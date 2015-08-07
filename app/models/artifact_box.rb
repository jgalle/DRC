class ArtifactBox < ActiveRecord::Base
  self.table_name = 'tblArtifactBox'
  self.primary_key = 'BoxID'
  
  has_many :context_artifact_boxes, :foreign_key => 'BoxID'
  belongs_to :project, :foreign_key => 'ProjectID'
  has_one :project_name, :through => :project
  accepts_nested_attributes_for :context_artifact_boxes, :allow_destroy => true
  
  before_create :update_data
  before_save :update_timestamps

  def update_data
    self.DateAdded = Time.now    
  end
  def update_timestamps
    self.DateChanged = Time.now
  end
  
end
