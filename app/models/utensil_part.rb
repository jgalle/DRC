class UtensilPart < ActiveRecord::Base
  self.table_name = 'tblUtensilPart'
  self.primary_key = 'UtensilPartID'
  #attr_accessible :utensil_part
end
