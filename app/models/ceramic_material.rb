class CeramicMaterial < ActiveRecord::Base
  self.table_name = 'tblCeramicMaterial'
  self.primary_key = 'CeramicMaterialID'
  #attr_accessible :ceramic_material
end
