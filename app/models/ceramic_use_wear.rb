class CeramicUseWear < ActiveRecord::Base
  self.table_name = 'tblCeramicUseWear'
  self.primary_key = 'CeramicUseWearID'
  #attr_accessible :artifact_id, :ceramic_completeness_id, :generate_context_artifact_id, :use_wear_location_id, :use_wear_pattern_id
  
  belongs_to :ceramic, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :ceramic_use_wear_location, :foreign_key => 'CeramicUseWearLocationID'
  belongs_to :ceramic_use_wear_pattern, :foreign_key => 'CeramicUserWearPatternID'
  belongs_to :ceramic_completeness, :foreign_key => 'CeramicCompletenessID'
end
