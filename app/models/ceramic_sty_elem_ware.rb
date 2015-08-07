class CeramicStyElemWare < ActiveRecord::Base
  self.table_name = 'tblCeramicStyElemWare'
  self.primary_key = 'CeramicStyElemWareID'
  
  belongs_to :sty_elem_meta_data, :class_name => "CeramicStyElemMetaData", :foreign_key => "StyElemMetaDataID"
  belongs_to :ceramic_ware, :class_name => "CeramicWare", :foreign_key => "WareID"
end
