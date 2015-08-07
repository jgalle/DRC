class GenObjectMaterial < ActiveRecord::Base
  self.table_name = 'tblObjectMaterial'
  self.primary_key = 'ObjectMaterialID'
  
  belongs_to :gen_object_type, :foreign_key => 'ObjectTypeID'
  
  #attr_accessible :object_material, :object_type_id
end
