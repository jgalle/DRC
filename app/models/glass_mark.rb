class GlassMark < ActiveRecord::Base
  self.table_name = 'tblGlassMark'
  self.primary_key = 'GlassMarkID'
  
  belongs_to :glass_mark_location, :foreign_key => 'GlassMarkLocationID'
  belongs_to :glass_mark, :foreign_key => 'GlassMarkID'
  belongs_to :glass, :foreign_key => 'GenerateContextArtifactID'
  
  #attr_accessible :artifact_id, :generate_context_artifact_id, :glass_mark_location_id, :mark
end
