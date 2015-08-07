class PasteInclusion < ActiveRecord::Base
  self.table_name = 'tblPasteInclusion'
  self.primary_key = 'PasteInclusionID'
  #attr_accessible :artifact_id, :paste_inclusion
end
