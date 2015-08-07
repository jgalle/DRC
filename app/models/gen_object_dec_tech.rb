class GenObjectDecTech < ActiveRecord::Base
  self.table_name = 'tblObjectDecTech'
  self.primary_key = 'ObjectDecTechID'
  
  belongs_to :gen_object_type, :foreign_key => 'objectTypeID'
  
  #attr_accessible :object_dec_tech, :object_type_id
end
