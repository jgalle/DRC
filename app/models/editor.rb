class Editor < ActiveRecord::Base
  self.table_name = 'tblEditor'
  self.primary_key = 'EditorID'
  #attr_accessible :editor
end
