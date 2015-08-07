class BuckleForm < ActiveRecord::Base
  self.table_name = 'tblBuckleForm'
  self.primary_key = 'BuckleFormID'
  
  belongs_to :buckle_element, :foreign_key => 'BuckleElementID'
  belongs_to :buckle_manu_tech, :foreign_key => 'BuckleManuTechID'
  belongs_to :buckle_material, :foreign_key => 'BuckleMaterialID'
  belongs_to :buckle_part, :foreign_key => 'BucklePartID'
  belongs_to :buckle_shape, :foreign_key => 'BuckleShapeID'
  belongs_to :buckle, :foreign_key => 'GenerateContextArtifactID'
  
  validates :Length, numericality: true, allow_nil: true
  validates :Width, numericality: true, allow_nil: true
  validates :PinCenterpointMeasure, numericality: true, allow_nil: true
  
  # #attr_accessible :article_id, :buckle_element_id, :buckle_manu_tech_id, :buckle_material_id, :buckle_part_id, :buckle_shape_id, :generate_context_artifact_id, :length, :pin_centerpoint_measure, :width
end
