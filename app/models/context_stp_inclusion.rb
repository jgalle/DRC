class ContextStpInclusion < ActiveRecord::Base
  self.table_name = 'tblContextSTPInclusions'
  self.primary_key = 'STPInclusionID'
    
  #attr_accessible :inclusion_description_id, :inclusion_size_id, :percentage_id
end
