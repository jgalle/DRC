class ContextFeatureType < ActiveRecord::Base
  self.table_name = 'tblContextFeatureType'
  self.primary_key = 'FeatureTypeID'

  has_many :contexts, :foreign_key => 'FeatureTypeID'
  has_many :context_features, :foreign_key => 'FeatureTypeID'
    
  #attr_accessible :feature_type

  accepts_nested_attributes_for :context_features, :allow_destroy => true

end
