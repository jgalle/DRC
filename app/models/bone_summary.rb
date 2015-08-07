class BoneSummary < ActiveRecord::Base
  self.table_name = 'tblBoneSummary'
  self.primary_key = 'SummaryID'
  # #attr_accessible :meta_content, :mniad, :mnim, :phase, :taxon
end
