class GenObjectVesselCategory < ActiveRecord::Base
  self.table_name = 'tblObjectVesselCategory'
  self.primary_key = 'ObjectVesselCategoryID'
  
  belongs_to :gen_object_type, :foreign_key => 'ObjectTypeID'
  #attr_accessible :object_type_id, :object_vessel_category
end
