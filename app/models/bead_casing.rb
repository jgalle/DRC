class BeadCasing < ActiveRecord::Base
  self.table_name = 'tblBeadCasing'
  self.primary_key = 'BeadCasingID'
  
  belongs_to :bead_casing_layer, :foreign_key => 'CasingLayerID'
  belongs_to :basic_color, :foreign_key => 'BeadCasingBasicColorID,'
  belongs_to :bead, :foreign_key => 'GenerateContextArtifactID'

  # #attr_accessible :artifact_id, :casing_layer_id, :mun_app_color_id, :generate_context_artifact_id
end
