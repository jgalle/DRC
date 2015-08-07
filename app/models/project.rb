class Project < ActiveRecord::Base
  before_create :update_data
  before_save :update_timestamps

  self.table_name = 'tblProject'
  self.primary_key = 'ProjectID'
  # default_scope :order => "ProjectID"
  # #attr_accessible :project_id, :institution_id, :project_name_id, :region_id, :project_country_id, :state, :county_id, :place_name_id, :beginning_date, :end_date, :state_site_number, :unitof_measure_id, :drainage_id, :site_soils, :nearest_water_source, :distancefrom_water_source, :elevation_type_id, :azimuth_orientation, :total_area_excavated, :total_convex_hull, :dates_excavated, :artifact_repository, :project_tag, :levelof_treatment_id, :project_notes, :site_abstract, :geo_datum_id, :geo_coordinate_system_id, :northing_geo_coordinateof_local_datum, :easting_geo_coordinateof_local_datum, :vertical_geo_coordinateof_local_datum, :images_atributes
  belongs_to :project_institution, :foreign_key => 'InstitutionID'
  belongs_to :project_name, :foreign_key => 'ProjectNameID'
  belongs_to :plantation, :foreign_key => 'PlantationID'
  belongs_to :project_country, :foreign_key => 'ProjectCountryID'
  belongs_to :project_county, :foreign_key => 'CountyID'
  belongs_to :project_drainage, :foreign_key => 'DrainageID'
  belongs_to :project_elevation_type, :foreign_key => 'ElevationTypeID'
  belongs_to :project_unitof_measure, :foreign_key => 'UnitofMeasureID'
  belongs_to :project_geo_datum, :foreign_key => 'GeoDatumID'
  belongs_to :project_geo_coordinate_system, :foreign_key => 'GeoCoordinateSystemID'
  belongs_to :created_by, :class_name => 'Editor', :foreign_key => 'EditorIDN'
  belongs_to :updated_by, :class_name => 'Editor', :foreign_key => 'EditorID'
  belongs_to :project_region, :foreign_key => 'RegionID'
  belongs_to :project_place_name, :foreign_key => 'PlaceNameID'
  belongs_to :project_levelof_treatment, :foreign_key => 'LevelOfTreatmentID'
  belongs_to :artifact_institution, :class_name => 'ProjectInstitution', :foreign_key => 'ArtifactRepositoryID'
  belongs_to :website_region, :foreign_key => 'WebsiteRegionID'
  belongs_to :project_state, :foreign_key => 'ProjectStateID'
  
  has_many :contexts, :foreign_key => 'ProjectID'
  
  has_and_belongs_to_many :images, :join_table => 'tblProjectSiteImage',  :association_foreign_key => 'ImageID', :foreign_key => 'ProjectID'
  
  accepts_nested_attributes_for :images, :allow_destroy => true
  
  has_many :project_images, :foreign_key => 'ProjectID', :dependent => :destroy
  accepts_nested_attributes_for :project_images, :allow_destroy => true
  
  validates :AzimuthOrientation, numericality: true, allow_nil: true
  validates :TotalAreaExcavated, numericality: true, allow_nil: true
  validates :TotalConvexHull, numericality: true, allow_nil: true
  validates :NorthingGeoCoordinateofLocalDatum, numericality: true, allow_nil: true
  validates :EastingGeoCoordinateofLocalDatum, numericality: true, allow_nil: true
  validates :VerticalGeoCoordinateofLocalDatum, numericality: true, allow_nil: true
  validates :ProjectID, length: {minimum: 1, maximum: 4}
  validates :State, length: {maximum: 2}, allow_nil: true
  validates_presence_of :InstitutionID
  validates_presence_of :ProjectNameID
  validates_presence_of :RegionID
  validates_presence_of :CountyID
  # validates_presence_of :State
  validates_presence_of :LevelofTreatmentID

  def project_name_str
    "#{self.project_name.ProjectName if self.project_name != nil}"
  end

  def update_data
    self.DateAdded = Time.now    
    # self.save
  end
  def update_timestamps
    self.DateChanged = Time.now
  end

end
