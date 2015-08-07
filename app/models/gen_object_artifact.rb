class GenObjectArtifact < ActiveRecord::Base
  self.table_name = 'tblObjectArtifact'
  
  belongs_to :gen_object, :foreign_key => 'ObjectID'
  belongs_to :image, :foreign_key => 'ImageID'
  belongs_to :bead, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :button, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :bone, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :buckle, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :ceramic, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :gen_artifact, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :glass, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :tobacco_pipe, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :utensil, :foreign_key => 'GenerateContextArtifactID'
  
  #attr_accessible :artifact_id, :object_id
  def set_artifact_id
    if self.ArtifactID == nil or self.ArtifactID == '-'
      if self.bead != nil
        self.ArtifactID = self.bead.ArtifactID
      elsif self.button != nil
        self.ArtifactID = self.button.ArtifactID
      elsif self.bone != nil
        self.ArtifactID = self.bone.ArtifactID
      elsif self.buckle != nil
        self.ArtifactID = self.buckle.ArtifactID
      elsif self.gen_artifact != nil
        self.ArtifactID = self.gen_artifact.ArtifactID
      elsif self.ceramic != nil
        self.ArtifactID = self.ceramic.ArtifactID
      elsif self.glass != nil
        self.ArtifactID = self.glass.ArtifactID
      elsif self.tobacco_pipe != nil
        self.ArtifactID = self.tobacco_pipe.ArtifactID
      elsif self.utensil != nil
        self.ArtifactID = self.utensil.ArtifactID
      end
      self.save
    end
  end
end
