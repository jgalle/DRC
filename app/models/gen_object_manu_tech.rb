class GenObjectManuTech < ActiveRecord::Base
  self.table_name = 'tblObjectManuTech'
  self.primary_key = 'ObjectManuTechID'
  
  belongs_to :gen_object_type, :foreign_key => 'ObjectTypeID'
  
  #attr_accessible :object_manu_tech, :object_type_id
end
