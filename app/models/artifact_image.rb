class ArtifactImage < ActiveRecord::Base
  self.table_name = 'tblArtifactImage'
  belongs_to :image, :foreign_key => 'ImageID'
  belongs_to :generate_context_artifact, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :bead, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :button, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :bone, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :buckle, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :ceramic, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :gen_artifact, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :glass, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :tobacco_pipe, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :utensil, :foreign_key => 'GenerateContextArtifactID'
  
  before_save :set_artifact_id
  
  def set_artifact_id
    if self.generate_context_artifact != nil
      self.ArtifactID = self.generate_context_artifact.ArtifactID
    end
  end
end
