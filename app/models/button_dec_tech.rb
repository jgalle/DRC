class ButtonDecTech < ActiveRecord::Base
  self.table_name = 'tblButtonDecTech'
  self.primary_key = 'ButtonDecTechID'
  
  belongs_to :button_decoration, :foreign_key => 'ButtonDecorationID'
  belongs_to :button_jewel_inlay_material, :foreign_key => 'JewelInlayMaterialID'
  belongs_to :basic_color, :foreign_key => 'ButtonDecTechBasicColorID'
  belongs_to :button, :foreign_key => 'GenerateContextArtifactID'
  
  # #attr_accessible :artifact_id, :button_decoration_id, :decorative_motif, :generate_context_artifact_id, :jewel_inlay_material_id, :mun_app_color_id
end
