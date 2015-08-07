class UtensilMaterial < ActiveRecord::Base
  self.table_name = 'tblUtensilMaterial'
  self.primary_key = 'UtensilMaterialID'
  #attr_accessible :utensil_material
end
