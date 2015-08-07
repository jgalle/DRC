class GlassDecTech < ActiveRecord::Base
  self.table_name = 'tblGlassDecTech'
  self.primary_key = 'GlassDecTechID'
  
  belongs_to :glass_dec_tech_type, :foreign_key => 'GlassDecTechTypeID'
  belongs_to :basic_color, :foreign_key=> 'GlassDecTechBasicColorID'
  belongs_to :glass_dec_tech_sty_elem, :foreign_key => 'GlassDecTechStyElemID'
  belongs_to :glass, :foreign_key => 'GenerateContextArtifactID'
  
  validates_presence_of :GlassDecTechTypeID
  
  #attr_accessible :artifact_id, :generate_context_artifact_id, :glass_dec_tech_sty_elem_id, :glass_dec_tech_type_id, :mun_app_color_id
end
