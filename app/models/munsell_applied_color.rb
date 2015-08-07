class MunsellAppliedColor < ActiveRecord::Base
  self.table_name = 'tblMunsellAppliedColor'
  self.primary_key = 'MunAppColorID'
  #attr_accessible :applied_color_written_description, :basic_color, :color_type, :munsell_range_applied_color
end
