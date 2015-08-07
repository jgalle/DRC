class ContextStratRel < ActiveRecord::Base
  self.table_name = 'tblContextStratRel'
  self.primary_key = 'ContextStratRelID'
  belongs_to :context_strat_rel_type, :foreign_key => 'StratRelTypeID'
  belongs_to :context, :foreign_key => 'ContextAutoID'
  #attr_accessible :context, :context_auto_id, :strat_rel_type_id
  # accepts_nested_attributes_for :strat_rel_type_id, :allow_destroy => true
  
  before_save :update_context
  
  validate :check_for_context
  
  def update_context
    if self.context != nil
      self.ContextID = self.context.ContextID
    end
  end
  
  def check_for_context
    context_id = "#{self.context.ProjectID}-#{self.Context}"
    errors.add(:Context, "Context must exist") unless (Context.where(:ContextID => context_id).size > 0)
  end
end
