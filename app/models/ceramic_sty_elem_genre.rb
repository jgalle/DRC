class CeramicStyElemGenre < ActiveRecord::Base
  self.table_name = 'tblCeramicStyElemGenre'
  self.primary_key = 'CeramicStyElemGenreID'

  belongs_to :sty_elem_meta_data, :class_name => "CeramicStyElemMetaData", :foreign_key => "StyElemMetaDataID"
  belongs_to :ceramic_genre, :class_name => "CeramicGenre", :foreign_key => "CeramicGenreID"
end
