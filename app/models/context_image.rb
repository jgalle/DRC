class ContextImage < ActiveRecord::Base
  self.table_name = 'tblContextImage'
  belongs_to :image, :foreign_key => 'ImageID'
  belongs_to :context, :foreign_key => 'ContextAutoID'
end
