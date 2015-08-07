class BeadShape < ActiveRecord::Base
  self.table_name = 'tblBeadShape'
  self.primary_key = 'BeadShapeID'
  # #attr_accessible :bead_shape
end
