class GenArtifactMaterial < ActiveRecord::Base
  self.table_name = 'tblGenArtifactMaterial'
  self.primary_key = 'GenArtifactMaterialID'
  
  belongs_to :gen_artifact_material_type, :foreign_key => 'GenArtifactMaterialTypeID'
  belongs_to :gen_artifact_manu_tech, :foreign_key => 'GenArtifactManuTechID'
  belongs_to :gen_artifact, :foreign_key => 'GenerateContextArtifactID'
  
  # validates_presence_of :gen_artifact_material_type
  # validates_presence_of :gen_artifact_manu_tech
  #attr_accessible :artifact_id, :gen_artifact_manu_tech_id, :gen_artifact_material_id, :gen_artifact_material_type_id, :generate_context_artifact_id
end
