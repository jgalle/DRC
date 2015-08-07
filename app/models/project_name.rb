class ProjectName < ActiveRecord::Base
  self.table_name = 'tblProjectName'
  self.primary_key = 'ProjectNameID'
  # default_scope :order => '"ProjectName"'
  #attr_accessible :project_name

  def to_s
    self.ProjectName
  end
end
