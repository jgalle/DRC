class ContextStpSediment < ActiveRecord::Base
  self.table_name = 'tblContextSTPSediments'
  self.primary_key = 'STPSedimentID'

  #attr_accessible :fine_sediment_texture_id, :mun_sed_color_id, :percentage_id
end
