class ContextFineSediment < ActiveRecord::Base
  self.table_name = 'tblContextFineSediment'
  self.primary_key = 'FineSedimentID'
  
  belongs_to :context, :foreign_key => 'ContextAutoID'
  belongs_to :context_fine_sediment_texture, :foreign_key => 'FineSedimentTextureID'
  belongs_to :context_rank_order, :foreign_key => 'RankOrder'
  belongs_to :context_percentage, :foreign_key => 'PercentageID'
  belongs_to :munsell_applied_color, :foreign_key => 'MunSedColorID'
  
  #attr_accessible :context_id, :excavator_sediment_color_description, :fine_sediment_texture_id, :mun_sed_color_id, :percentage_id, :rank_order
  
  # validates :RankOrder, numericality: {only_integer: true}, allow_nil: true
  
end
