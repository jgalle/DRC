class ContextStpLevel < ActiveRecord::Base
  self.table_name = 'tblContextSTPLevel'
  self.primary_key = 'ContextSTPLevelID'
  #attr_accessible :context_id, :stpclosing, :stplevel

  belongs_to :context, :foreign_key => 'ContextAutoID'
  has_many :context_stp_inclusions, :foreign_key => 'ContextSTPLevelID', :dependent => :delete_all
  has_many :context_stp_sediments, :foreign_key => 'ContextSTPLevelID', :dependent => :delete_all

  accepts_nested_attributes_for :context_stp_inclusions, :allow_destroy => true
  accepts_nested_attributes_for :context_stp_sediments, :allow_destroy => true
  
  validates :STPLevel, numericality: true, allow_nil: true
  validates :STPClosing, numericality: true, allow_nil: true
  
  # after_create :set_context_id
  before_save :set_context_id
  
  def set_context_id
    if self.context != nil
      self.ContextID = "#{self.context.ContextID}"
      # self.save
    else
      self.ContextID = 'temp'
    end
  end
  
end
