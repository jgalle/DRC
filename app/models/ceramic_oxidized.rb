class CeramicOxidized < ActiveRecord::Base
  self.table_name = 'tblCeramicOxidized'
  self.primary_key = 'OxidizedVersusReducedID'
  #attr_accessible :oxidized_versus_reduced
  
  def to_label
    "#{OxidizedVersusReduced}"
  end
end
