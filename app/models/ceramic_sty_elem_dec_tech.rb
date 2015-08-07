class CeramicStyElemDecTech < ActiveRecord::Base
  self.table_name = 'tblCeramicStyElemDecTech'
  self.primary_key = 'CeramicStyElemDecTechID'
  
  belongs_to :sty_elem_meta_data, :class_name => "CeramicStyElemMetaData", :foreign_key => "StyElemDecTechID"
  belongs_to :sty_elem_manu_tech, :class_name => "CeramicStyElemManuTech", :foreign_key => "StyElemManuTechID"
end
