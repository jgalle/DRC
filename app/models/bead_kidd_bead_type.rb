class BeadKiddBeadType < ActiveRecord::Base
  self.table_name = 'tblBeadKiddBeadType'
  self.primary_key = 'KiddBeadTypeID'
  # #attr_accessible :kidd_bead_type
  def bead_type_label
    "#{self.KiddBeadTypeID} - #{self.KiddBeadType}"
  end
  
end
