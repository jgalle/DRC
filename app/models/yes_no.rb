class YesNo < ActiveRecord::Base
  self.table_name = 'tblYesNo'
  self.primary_key = 'YesNoID'
  #attr_accessible :yes_no
end
