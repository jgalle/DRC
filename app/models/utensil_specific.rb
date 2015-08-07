class UtensilSpecific < ActiveRecord::Base
  self.table_name = 'tblUtensilSpecific'
  self.primary_key = 'UtensilSpecificID'
  
  belongs_to :utensil_part, :foreign_key => 'UtensilPartlID'
  belongs_to :utensil_shape, :foreign_key => 'UtensilShapeID'
  belongs_to :utensil_manu_tech, :foreign_key => 'UtesilManuTechID'
  belongs_to :utensil_material, :foreign_key => 'UtensilMaterialID'
  belongs_to :utensil, :foreign_key => 'GenerateContextArtifactID'

  validates :PartLength, numericality: true, allow_nil: true
  validates :PartWidth, numericality: true, allow_nil: true
  validates :PartHeight, numericality: true, allow_nil: true
  
  #attr_accessible :artifact_id, :generate_context_artifact_id, :untesil_part_id, :utensil_manu_tech_id, :utensil_material_id, :utensil_shape_id
end
