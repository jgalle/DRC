class GenArtifactDecTech < ActiveRecord::Base
  self.table_name = 'tblGenArtifactDecTech'
  self.primary_key = 'GenArtifactDecTechID'
  
  belongs_to :gen_artifact_dec_tech_type, :foreign_key => 'GenArtifactDecTechTypeID'
  belongs_to :basic_color, :foreign_key => 'GenArtDecTechBasicColorID'
  belongs_to :gen_artifact, :foreign_key => 'GenerateContextArtifactID'
  
  #attr_accessible :artifact_id, :decoration_notes, :gen_artifact_dec_tech_type_id, :generate_context_artifact_id, :mun_app_color_id
end
