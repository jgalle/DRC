class GenObjectImage < ActiveRecord::Base
  self.table_name = 'tblObjectImage'
  belongs_to :image, :foreign_key => 'ImageID'
  belongs_to :gen_object, :foreign_key => 'ObjectID'
end
