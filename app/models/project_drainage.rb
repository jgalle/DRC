class ProjectDrainage < ActiveRecord::Base
  self.table_name = 'tblProjectDrainage'
  self.primary_key = 'DrainageID'
  default_scope :order => '"Drainage"'
  #attr_accessible :drainage
end
