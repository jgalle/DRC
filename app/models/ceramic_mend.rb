class CeramicMend < ActiveRecord::Base
  self.table_name = 'tblCeramicMends'
  self.primary_key = 'CeramicMendID'
  #attr_accessible :generate_context_artifact_id, :mends_generate_context_artifact_id
  
  belongs_to :ceramic, :class_name => 'Ceramic', :foreign_key => 'GenerateContextArtifactID'
  belongs_to :mends_ceramic, :class_name => 'Ceramic', :foreign_key => 'MendsGenerateContextArtifactID'

  before_save :update_artifact_id

  def update_artifact_id
    self.ArtifactID = self.ceramic.ArtifactID
    self.MendsToArtifactID = self.mends_ceramic.ArtifactID rescue ''
  end
end
