class CeramicGenre < ActiveRecord::Base
  self.table_name = 'tblCeramicGenre'
  self.primary_key = 'CeramicGenreID'
  #attr_accessible :ceramic_genre
end
