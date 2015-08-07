class ContextArtifactBox < ActiveRecord::Base
  self.table_name = 'tblContextArtifactBox'
  
  belongs_to :artifact_box, :foreign_key => 'BoxID'
  belongs_to :context, :foreign_key => 'ContextID', :primary_key => 'ContextID'
end
