class SedimentColor < ActiveRecord::Base
  self.table_name = 'tblSedimentColor'
  self.primary_key = 'MunSedColorID'
  #attr_accessible :munsell_description, :munsell_sediment_color
end
