class GenObjectDecPattern < ActiveRecord::Base
  self.table_name = 'tblObjectDecPattern'
  self.primary_key = 'ObjectDecPatternID'
  
  belongs_to :gen_object_type, :foreign_key => 'ObjectTypeID'
  
  #attr_accessible :object_dec_pattern, :object_type_id
end
