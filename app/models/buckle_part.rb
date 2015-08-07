class BucklePart < ActiveRecord::Base
  self.table_name = 'tblBucklePart'
  self.primary_key = 'BucklePartID'
  # #attr_accessible :buckle_part
end
