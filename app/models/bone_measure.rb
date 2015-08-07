class BoneMeasure < ActiveRecord::Base
  self.table_name = 'tblBoneMeasure'
  self.primary_key = 'BoneMeasureID'

  belongs_to :bone_measuring_description, :foreign_key => 'MeasuringDescriptionID'
  belongs_to :accurate_yes_no, :class_name => 'YesNo', :foreign_key => 'Accurate'
  belongs_to :bone, :foreign_key => 'GenerateContextArtifactID'
  
  validates :Measurement, numericality: true, allow_nil: true
  
  # #attr_accessible :accurate, :artifact_id, :generate_context_artifact_id, :measurement, :measuring_description_id
end
