class BeadMaterial < ActiveRecord::Base
  self.table_name = 'tblBeadMaterial'
  self.primary_key = 'BeadMaterialID'
  # #attr_accessible :bead_material
end
