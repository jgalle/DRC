class ImageType < ActiveRecord::Base
  self.table_name = 'tblImageType'
  self.primary_key = 'ImageTypeID'
  #attr_accessible :image_table, :image_type
end
