class ProjectElevationType < ActiveRecord::Base
  self.table_name = 'tblProjectElevationType'
  self.primary_key = 'ElevationTypeID'
  default_scope :order => '"ElevationType"'
  #attr_accessible :elevation_type
end
