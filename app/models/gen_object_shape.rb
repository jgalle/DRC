class GenObjectShape < ActiveRecord::Base
  self.table_name = 'tblObjectShape'
  self.primary_key = 'ObjectShapeID'
  
  belongs_to :gen_object_type, :foreign_key => 'objectTypeID'
  #attr_accessible :object_shape, :object_type_id
end
