class GlassMend < ActiveRecord::Base
  self.table_name = 'tblGlassMends'
  self.primary_key = 'GlassMendID'
  
  # belongs_to :glass_
  #attr_accessible :artifact_id, :mends_to_artifact_id
end
