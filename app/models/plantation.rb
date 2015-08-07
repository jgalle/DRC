class Plantation < ActiveRecord::Base
  self.table_name = 'tblPlantation'
  self.primary_key = 'PlantationID'
  default_scope :order => '"PlantationName"'
  #attr_accessible :plantation_name
end
