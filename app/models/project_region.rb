class ProjectRegion < ActiveRecord::Base
  self.table_name = 'tblProjectRegion'
  self.primary_key = 'RegionID'
  default_scope :order => '"Region"'
  #attr_accessible :region
  has_many :projects, :foreign_key => 'RegionID'
end
