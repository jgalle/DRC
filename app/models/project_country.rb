class ProjectCountry < ActiveRecord::Base
  self.table_name = 'tblProjectCountry'
  self.primary_key = 'ProjectCountryID'
  default_scope :order => '"ProjectCountry"'
  # #attr_accessible :title, :body
  
  def to_label
    "#{ProjectCountry}"
  end
end
