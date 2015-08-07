class ContextFeature < ActiveRecord::Base
  self.table_name = 'tblContextFeature'
  self.primary_key = 'FeatureID'
  
  belongs_to :context_feature_type, :foreign_key => 'FeatureTypeID'
  belongs_to :context_feature_plan_shape, :foreign_key => 'PlanShapeID'
  belongs_to :context_feature_profile_shape, :foreign_key => 'ProfileShapeID'
  belongs_to :project, :foreign_key => 'ProjectID'
  
  has_many :contexts, -> (join_or_model) {
      if join_or_model.is_a? JoinDependency::JoinAssociation
        where('FeatureNumber' => Model.arel_table['FeatureNumber'])
      else
        where('FeatureNumber' => join_or_model.FeatureNumber)
      end
    },
    :foreign_key => 'ProjectID', 
    :primary_key => 'ProjectID'
  
    accepts_nested_attributes_for :contexts, :allow_destroy => true
  
    validates :FeatureTPQ, numericality: true, allow_nil: true
    validates :Length, numericality: true, allow_nil: true
    validates :Width, numericality: true, allow_nil: true
    validates :Depth, numericality: true, allow_nil: true
    validates :OriginalPitCutLength, numericality: true, allow_nil: true
    validates :OriginalPitCutWidth, numericality: true, allow_nil: true
    validates :OriginalPitCutDepth, numericality: true, allow_nil: true
    validates :CentroidX, numericality: true, allow_nil: true
    validates :CentroidY, numericality: true, allow_nil: true
    validates_presence_of :ProjectID
    validates_presence_of :FeatureNumber
    validates_presence_of :FeatureTypeID
    # validates :FeatureNumber, allow_nil: false, uniqueness: true
    
    validate :feature_number_is_unique?
    def feature_number_is_unique?
      if ContextFeature.where(:ProjectID => self.ProjectID, :FeatureNumber => self.FeatureNumber).where.not(:FeatureID => self.FeatureID).size > 0
        errors.add('FeatureNumber', 'must be unique') 
      end
    end
    
    
  #attr_accessible :centroid_c, :centroid_y, :date_added, :date_changed, :depth, :description, :editor_id, :editor_id_n, :feature_group, :feature_group_interpretation, :feature_number, :feature_tpq, :length, :original_cut_depth, :original_pit_cut_length, :original_pit_cut_width, :plan_shape_id, :profile_shape_id, :width

  before_create :update_data
  before_save :update_timestamps
  
  def update_data
    self.DateAdded = Time.now    
    self.DateChanged = Time.now    
    # self.save
  end
  def update_timestamps
    self.DateChanged = Time.now
  end
  
end
