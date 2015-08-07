class ProjectInstitution < ActiveRecord::Base
  self.table_name = 'tblProjectInstitution'
  self.primary_key = 'InstitutionID'
  has_many :projects, :foreign_key => 'InstitutionID'
  
  # default_scope :order => "Institution"
  #attr_accessible :institution, :projects, :project_ids
  accepts_nested_attributes_for :projects
  
end
