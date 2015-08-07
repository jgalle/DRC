class ProjectGeoCoordinateSystem < ActiveRecord::Base
  self.table_name = 'tblProjectGeoCoordinateSystem'
  self.primary_key = 'GeoCoordinateSystemID'
  #attr_accessible :geo_coordinate_system
end
