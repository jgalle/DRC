class CeramicStyElemIndividualDesign < ActiveRecord::Base
  self.table_name = 'tblCeramicStyElemIndividualDesign'
  self.primary_key = 'CeramicStyElemIndividualDesignID'

  belongs_to :sty_elem_meta_data, :class_name => "CeramicStyElemMetaData", :foreign_key => "StyElemMetaDataID"
  belongs_to :sty_elem_individual_design_element, :class_name => "StyElemIndividualDesignElement", :foreign_key => "CeramicStyElemIndividualDesignID"
end
