class BoneTaxonCategory < ActiveRecord::Base
  self.table_name = 'tblBoneTaxonCategory'
  self.primary_key = 'TaxonCategoryID'
  # #attr_accessible :taxon_category
end
