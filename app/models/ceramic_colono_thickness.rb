class CeramicColonoThickness < ActiveRecord::Base
  self.table_name = 'tblCeramicColonoThickness'
  self.primary_key = 'ColonoThicknessID'
  # #attr_accessible :ceramic_completeness_id, :colono_sherd_thickness, :generate_context_artifact_id
  belongs_to :ceramic_completeness, :foreign_key => 'CeramicCompletenessID'
  belongs_to :ceramic, :foreign_key => 'GenerateContextArtifactID'

  validates :ColonoSherdThickness, numericality: true, allow_nil: true
  validates_presence_of :ColonoSherdThickness
  validates_presence_of :CeramicCompletenessID
  
  before_save :update_artifact_id

  def update_artifact_id
    self.ArtifactID = self.ceramic.ArtifactID
  end
end
