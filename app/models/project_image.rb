class ProjectImage < ActiveRecord::Base
  self.table_name = 'tblProjectImage'
  belongs_to :image, :foreign_key => 'ImageID'
  belongs_to :project, :foreign_key => 'ProjectID'
end
