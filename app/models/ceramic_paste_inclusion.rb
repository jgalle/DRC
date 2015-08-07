class CeramicPasteInclusion < ActiveRecord::Base
  
  self.table_name = 'tblCeramicPasteInclusion'
  # self.primary_key = 'ArtifactID'
  
  belongs_to :ceramic, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :paste_inclusion, :foreign_key => 'PasteInclusionID'
  #attr_accessible :artifact_id, :paste_inclusion_id
  
  validates_presence_of :PasteInclusionID
  
  before_save :update_artifact_id

  def update_artifact_id
    self.ArtifactID = self.ceramic.ArtifactID
  end
end
