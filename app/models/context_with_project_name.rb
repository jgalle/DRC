class ContextWithProjectName < ActiveRecord::Base
  # self.table_name = 'tblContext'
  self.primary_key = 'ContextAutoID'
  belongs_to :project, :foreign_key => 'ProjectID'
  has_one :project_name, :through => :project, :foreign_key => 'ProjectNameID'
  # has_one :project_name, -> (object) { where("\"ProjectNameID\" = ?", object.project.ProjectNameID) }, :foreign_key => 'ProjectNameID'
  # belongs_to :yes_no, :foreign_key => 'YesNo'
  belongs_to :context_level_type, :foreign_key => 'LevelTypeID'
  belongs_to :context_deposit_type, :foreign_key => 'DepositTypeID'
  belongs_to :photographs, :class_name => 'YesNo', :foreign_key => 'Photographs'
  belongs_to :spatial_distribution, :class_name => 'YesNo', :foreign_key => 'SpatialDistribution'
  belongs_to :context_unit_type, :foreign_key => 'UnitTypeID'
  belongs_to :context_feature_type, :foreign_key => 'FeatureTypeID'
  belongs_to :artifact_presence, :class_name => 'YesNo', :foreign_key => 'ArtifactPresence'

  belongs_to :created_by, :class_name => 'Editor', :foreign_key => 'editorIDN'
  belongs_to :updated_by, :class_name => 'Editor', :foreign_key => 'editorID'
  has_and_belongs_to_many :images, :join_table => 'tblContextImage', :foreign_key => 'ContextAutoID'
  has_many :context_elevations, :foreign_key => 'ContextAutoID', :dependent => :destroy
  has_many :context_strat_rels, :foreign_key => 'ContextAutoID', :dependent => :destroy
  # has_many :context_quadrat_boundaries, :foreign_key => 'QuadratID', :dependent => :destroy
  has_many :context_quadrat_boundaries, -> (join_or_model) {
      if join_or_model.is_a? JoinDependency::JoinAssociation
        where('QuadratID' => Model.arel_table['QuadratID'])
      else
        where('QuadratID' => join_or_model.QuadratID)
      end
    },
    :foreign_key => 'ProjectID', 
    :primary_key => 'ProjectID'
        
  has_many :context_stp_levels, :foreign_key => 'ContextAutoID', :dependent => :destroy
  # has_many :context_features, :through => :context_feature_type #, :conditions => proc("feature_number = #{self.feature_number}") #:finder_sql => "SELECT tbl_context_feature.* FROM tbl_context_feature INNER JOIN tbl_context_feature_type ON tbl_context_feature.feature_type_id = tbl_context_feature_type.feature_type_id WHERE tbl_context_feature_type.feature_type_id = #{self.feature_type_id} AND tbl_context_feature.feature_number = '#{feature_number}'" 
  has_many :context_features, :finder_sql => Proc.new {
      %Q{
        SELECT "tblContextFeature".* FROM "tblContextFeature" WHERE "tblContextFeature"."FeatureNumber" = '#{self.FeatureNumber}' AND "tblContextFeature"."ProjectID" = '#{self.ProjectID}'
      }
  }

  has_many :context_fine_sediments, :foreign_key => 'ContextAutoID', :dependent => :destroy
  has_many :context_inclusions, :foreign_key => 'ContextAutoID', :dependent => :destroy
  has_many :context_samples, :foreign_key => 'ContextAutoID', :dependent => :destroy

  has_many :beads, through: :context_samples
  has_many :bones, through: :context_samples
  has_many :buttons, through: :context_samples
  has_many :buckles, through: :context_samples
  has_many :ceramics, through: :context_samples
  has_many :gen_artifacts, through: :context_samples
  has_many :glasses, through: :context_samples
  has_many :tobacco_pipes, through: :context_samples
  has_many :utensils, through: :context_samples
  

  has_one :context_feature, -> (join_or_model) {
      if join_or_model.is_a? JoinDependency::JoinAssociation
        where('FeatureNumber' => Model.arel_table['FeatureNumber'])
      else
        where('FeatureNumber' => join_or_model.FeatureNumber)
      end
    },
    :foreign_key => 'ProjectID', 
    :primary_key => 'ProjectID'
    
  has_many :context_images, :foreign_key => 'ContextAutoID', :dependent => :destroy
  accepts_nested_attributes_for :context_images, :allow_destroy => true


  after_create :set_context_id
  before_save :set_temp_context_id
  before_create :update_data
  before_save :update_timestamps
  
  before_save :remove_wrong_unit_type_data
  before_save :check_for_new_quadrat_ID
  
  validates :ContextLength, numericality: true, allow_nil: true
  validates :ContextWidth, numericality: true, allow_nil: true
  validates :MaximumLithostratigraphicThickness, numericality: true, allow_nil: true
  validates :ActualMeasuredVolume, numericality: true, allow_nil: true
  validates :QuadratLength, numericality: true, allow_nil: true
  validates :QuadratWidth, numericality: true, allow_nil: true
  validates :STPEasting, numericality: true, allow_nil: true
  validates :STPNorthing, numericality: true, allow_nil: true
  validates_presence_of :Context
  validates_presence_of :ProjectID
  validates_presence_of :ArtifactPresence
  
  validate :date_opened_is_date?
  # validate :DateOpened, date: true
  # validate :DateClosed, date: true

  validate :existing_context_id?
  def existing_context_id?
    if self.ContextAutoID == nil and !self.ProjectID != nil and Project.find(self.ProjectID).contexts.where('"Context" = ?',  self.Context).size > 0
      errors.add('Context', 'must be a unique') 
    end
  end
  
  
  def remove_wrong_unit_type_data
    if self.UnitTypeID != 1  #stp
      self.context_stp_levels.each do |stp|
        stp.destroy
      end
      self.STPEasting = nil
      self.STPNorthing = nil
    end
    # if self.UnitTypeID != 3  #quadrat
    #   # self.QuadratID = nil
    # end
    # if self.UnitTypeID != 4  #feature
    #   self.FeatureNumber = nil
    # end
  end
  
  def check_for_new_quadrat_ID
    if self.UnitTypeID == 3 and self.QuadratID != nil and self.QuadratID != ''
      if ContextQuadratBoundary.where(:ProjectID => self.project.ProjectID, :QuadratID => self.QuadratID).size == 0
        cqb = ContextQuadratBoundary.create(:ProjectID => self.project.ProjectID, :QuadratID => self.QuadratID)
      end
    end
  end
  
  def date_opened_is_date?
    if !self.DateOpened == nil and !self.DateOpened.is_a?(Date)
      errors.add('DateOpened', 'must be a valid date') 
    end
  end

  validate :date_closed_is_date?
  
  def date_closed_is_date?
    if !self.DateClosed == nil and !self.DateClosed.is_a?(Date)
      errors.add('DateClosed', 'must be a valid date') 
    end
  end

  validate :context_sample_check
  
  def context_sample_check
    if self.context_stp_levels.size > 0 and self.context_samples.size == 0
      errors.add('context_stp_levels', 'must have have a Context Sample before saving')
    end
  end
  #attr_accessible :feature_number

  # accepts_nested_attributes_for :images, :allow_destroy => true
  accepts_nested_attributes_for :context_elevations, :allow_destroy => true
  accepts_nested_attributes_for :context_strat_rels, :allow_destroy => true
  accepts_nested_attributes_for :context_quadrat_boundaries, :allow_destroy => true
  accepts_nested_attributes_for :context_stp_levels, :allow_destroy => true
  accepts_nested_attributes_for :context_features, :allow_destroy => true
  accepts_nested_attributes_for :context_fine_sediments, :allow_destroy => true
  accepts_nested_attributes_for :context_inclusions, :allow_destroy => true
  accepts_nested_attributes_for :context_samples, :allow_destroy => true
  
  def set_temp_context_id
    if self.ContextID == nil
      self.ContextID = "temp"
    end
  end
  def set_context_id
    self.ContextID = "#{self.project.ProjectID}-#{self.Context}"
    self.save
  end
  
  def update_data
    self.DateAdded = Time.now    
    # self.DateChanged = Time.now    
    # self.save
  end
  def update_timestamps
    self.DateChanged = Time.now
  end
  
end
