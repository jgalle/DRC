class ContextElevation < ActiveRecord::Base
  self.table_name = 'tblContextElevation'
  self.primary_key = 'ContextElevationID'
  belongs_to :context, :foreign_key => 'ContextAutoID'
  belongs_to :context_open_close, :foreign_key => 'OpeningClosingID'
  belongs_to :context_elevation_location, :foreign_key => 'ContentElevationLocID'

  #attr_accessible :context_elevation_loc_id, :opening_closing_id, :elevation_amount
  validates :ElevationAmount, numericality: true, allow_nil: true
end
