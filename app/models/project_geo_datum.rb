class ProjectGeoDatum < ActiveRecord::Base
  self.table_name = 'tblProjectGeoDatum'
  self.primary_key = 'GeoDatumID'
  #attr_accessible :geo_datum
end
