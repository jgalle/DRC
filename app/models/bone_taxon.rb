class BoneTaxon < ActiveRecord::Base
  self.table_name = 'tblBoneTaxon'
  self.primary_key = 'TaxonID'
  
  belongs_to :bone_taxon_category, :foreign_key => 'TaxonCategoryID'
  
  # #attr_accessible :biomass_category, :bone_type, :class_category, :english, :idor_unid, :latin, :mt_wt_ad, :mt_wt_im, :pg_cow_sg, :taxon, :taxon_category_id, :taxon_group_category, :txn_order, :wildor_domestic
end
