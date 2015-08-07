class ContextQuadratBoundary < ActiveRecord::Base
  self.table_name = 'tblContextQuadratBoundary'
  self.primary_key = 'QuadratBoundaryID'
  # belongs_to :context, :foreign_key => 'QuadratID'
  #attr_accessible :project_id, :quadrat_easting, :quadrat_id, :quadrat_northing
  
  # before_save :grab_quadrat_id
  
  validates :QuadratNorthing, numericality: true, allow_nil: true
  validates :QuadratEasting, numericality: true, allow_nil: true
  
  def grab_quadrat_id
    self.QuadratID = self.context.QuadratID
    self.ProjectID = self.context.project.ProjectID
  end
end
