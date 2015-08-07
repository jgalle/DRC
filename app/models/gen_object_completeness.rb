class GenObjectCompleteness < ActiveRecord::Base
  self.table_name = 'tblObjectCompleteness'
  self.primary_key = 'ObjectCompletenessID'
  
  belongs_to :gen_object_type, :foreign_key => 'ObjectTypeID'
  
  #attr_accessible :object_completeness, :object_type_id
end
