class BuckleDecTech < ActiveRecord::Base
  self.table_name = 'tblBuckleDecTech'
  self.primary_key = 'BuckleDecTechID'
  
  belongs_to :buckle_dec_tech_type, :foreign_key => 'BuckleDecTechTypeID'
  belongs_to :buckle_dec_motif, :foreign_key => 'BuckleDecMotifType'
  belongs_to :buckle, :foreign_key => 'GenerateContextArtifactID'
  
  # #attr_accessible :artifact_id, :buckle_dec_motif_id, :buckle_dec_tech_type_id, :generate_context_artifact_id
end
