class ProjectPlaceName < ActiveRecord::Base
  self.table_name = 'tblProjectPlaceName'
  self.primary_key = 'PlaceNameID'
  default_scope :order => '"PlaceName"'
  #attr_accessible :place_name
end
