class ProjectCounty < ActiveRecord::Base
  self.table_name = 'tblProjectCounty'
  self.primary_key = 'CountyID'
  # #attr_accessible :title, :body
  
  def to_label
    "#{County}"
  end
  #attr_accessible :county
end
