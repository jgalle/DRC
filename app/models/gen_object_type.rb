class GenObjectType < ActiveRecord::Base
  self.table_name = 'tblObjectType'
  self.primary_key = 'ObjectTypeID'
  
  #attr_accessible :object_type
end
