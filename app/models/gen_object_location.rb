class GenObjectLocation < ActiveRecord::Base
  self.table_name = 'tblObjectLocation'
  self.primary_key = 'ObjectLocationID'
  
  belongs_to :gen_object, :foreign_key => 'ObjectID'
  
  #attr_accessible :artifact_handler, :date_loaned, :date_returned, :exhibit_name, :institution_contact, :loan_length, :loaned_to, :notes, :object_id
end
