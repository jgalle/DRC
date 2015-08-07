class ContextSampleLocation < ActiveRecord::Base
  self.table_name = 'tblContextSampleLocation'
  self.primary_key = 'ContextSampleLocationAutoID'
  
  belongs_to :context_sample, :class_name => "ContextSample", :foreign_key => "ContextSampleID"
  belongs_to :context_sample_institution, :class_name => "ContextSampleInstitution", :foreign_key => "ContextSampleLocationInstitutionID"
  belongs_to :context_sample_status, :class_name => "ContextSampleStatus", :foreign_key => "ContextSampleStatusID"
  
end
