class GenObjectForm < ActiveRecord::Base
  self.table_name = 'tblObjectForm'
  self.primary_key = 'ObjectFormID'
  
  belongs_to :gen_object_type, :foreign_key => 'ObjectTypeID'
  
  #attr_accessible :object_form, :object_type_id
end
