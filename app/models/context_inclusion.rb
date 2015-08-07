class ContextInclusion < ActiveRecord::Base
  self.table_name = 'tblContextInclusion'
  self.primary_key = 'InclusionID'

  belongs_to :context, :foreign_key => 'AutoContextID'
  belongs_to :context_inclusion_description, :foreign_key => 'inclusion_description_id'
  belongs_to :context_inclusion_size, :foreign_key => 'InclussionSizeID'
  belongs_to :context_rank_order, :foreign_key => 'RankOrder'
  belongs_to :context_percentage, :foreign_key => 'PercentageID'

  #attr_accessible :context_id, :inclusion_description_id, :inclusion_side_id, :percentage_id, :rank_order
  
  validates :RankOrder, numericality: true, allow_nil: true
  
end
