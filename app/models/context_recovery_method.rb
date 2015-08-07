class ContextRecoveryMethod < ActiveRecord::Base
  self.table_name = 'tblContextRecoveryMethod'
  self.primary_key = 'RecoveryMethodID'
  #attr_accessible :recovery_method
end
