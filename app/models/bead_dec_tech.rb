class BeadDecTech < ActiveRecord::Base
  self.table_name = 'tblBeadDecTech'
  self.primary_key = 'BeadDecTechID'
  
  belongs_to :bead_decoration, :foreign_key => 'BeadDecorationID'
  belongs_to :munsell_applied_color, :foreign_key => 'MunAppColorID'
  belongs_to :bead, :foreign_key => 'GenerateContextArtifactID'
  
  # #attr_accessible :artifact_id, :bead_decoration_id, :dec_description, :mun_app_color_id, :generate_context_artifact_id
end
