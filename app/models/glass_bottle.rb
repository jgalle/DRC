class GlassBottle < ActiveRecord::Base
  self.table_name = 'tblGlassBottle'
  self.primary_key = 'GlassBottleID'
  
  belongs_to :glass_bottle_element, :foreign_key => 'GlassBottleElementID'
  belongs_to :glass_bottle_shape, :foreign_key => 'GlassBottleShapeID'
  belongs_to :glass_bottle_manu_tech, :foreign_key => 'GlassBottleManuTechID'
  # belongs_to :glass_bottle_treatment, :foreign_key => 'GlassBottleTreatmentID'
  belongs_to :glass, :foreign_key => 'GenerateContextArtifactID'
  
  #attr_accessible :artifact_id, :generate_context_artifact_id, :glass_bottle_element_id, :glass_bottle_manu_tech_id, :glass_bottle_shape_id, :glass_bottle_treatment_id
end
