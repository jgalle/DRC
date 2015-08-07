class ContextSample < ActiveRecord::Base
  self.table_name = 'tblContextSample'
  self.primary_key = 'ContextSampleID'
  
  belongs_to :context, :foreign_key => 'ContextAutoID'
  belongs_to :context_recovery_method, :foreign_key => 'RecoveryMethodID'
  belongs_to :context_sample_type, :foreign_key => 'ContextSampleTypeID'
  belongs_to :context_screen_size, :foreign_key => 'ScreenSizeID'
  
  has_one :project, :through => :context, :foreign_key => 'ProjectID'
  
  has_many :context_sample_locations, :foreign_key => 'ContextSampleID'
  
  has_many :generate_context_artifacts, :foreign_key => 'ContextSampleID'#, :dependent => :destroy

  has_many :beads, through: :generate_context_artifacts
  has_many :bones, through: :generate_context_artifacts
  has_many :buttons, through: :generate_context_artifacts
  has_many :buckles, through: :generate_context_artifacts
  has_many :ceramics, through: :generate_context_artifacts
  has_many :gen_artifacts, through: :generate_context_artifacts
  has_many :glasses, through: :generate_context_artifacts
  has_many :tobacco_pipes, through: :generate_context_artifacts
  has_many :utensils, through: :generate_context_artifacts
  
  before_save :set_context_sample_id
  after_create :create_sequence
  before_destroy :drop_sequence
  
  accepts_nested_attributes_for :context_sample_locations, :allow_destroy => true
  
  #attr_accessible :box_comments, :context_id, :context_sample_id, :context_sample_type_id, :recovery_method_id, :sample_number, :sample_size, :screen_size_id, :storage_box_number
  
  validates :RecoveryMethodID, presence: true
  validates :ContextSampleTypeID, presence: true
  
  
  def create_sequence
    begin
      connection = ActiveRecord::Base.connection
      max_artifact_id = GenerateContextArtifact.where('ContextSampleID' => self.ContextSampleID).maximum('ArtifactID')
      if max_artifact_id != nil
        max_artifact_id = max_artifact_id.split('-').last.to_i + 1
      else
        max_artifact_id = 1
      end
      # connection.execute("IF EXISTS (SELECT 0 FROM pg_class where relname = '#{self.ContextSampleID.gsub('.','_').downcase}_seq' ) THEN  drop sequence \"#{self.ContextSampleID.gsub('.','_').downcase}_seq\";END IF;")
      connection.execute("drop sequence if exists \"#{self.ContextSampleID.gsub('.','_').downcase}_seq\"")
      connection.execute("CREATE SEQUENCE \"#{self.ContextSampleID.gsub('.','_').downcase}_seq\" MINVALUE 1 START WITH #{max_artifact_id} INCREMENT BY 1")
    rescue
      connection = ActiveRecord::Base.connection
      puts 'updated existing sequence'
      max_artifact_id = GenerateContextArtifact.where('ContextSampleID' => self.ContextSampleID).maximum('ArtifactID')
      if max_artifact_id != nil
        max_artifact_id = max_artifact_id.split('-').last.to_i + 1
      else
        max_artifact_id = 1
      end
      connection.execute("alter SEQUENCE \"#{self.ContextSampleID.gsub('.','_').downcase}_seq\" RESTART WITH #{max_artifact_id}")
    end
    
  end

  def drop_sequence
    connection = ActiveRecord::Base.connection
    begin
      connection.execute("DROP SEQUENCE \"#{self.ContextSampleID.gsub('.','_').downcase}_seq\";")
    rescue
      puts 'unable to delete sequence'
    end
    
  end
  
  def set_context_sample_id
    self.ContextID = self.context.ContextID
    self.ContextAutoID = self.context.id
    self.ContextSampleID = "#{self.ContextID}-#{self.context_recovery_method.RecoveryMethodTLA}#{(self.SampleNumber != nil and self.SampleNumber != '') ? '-'+self.SampleNumber : ''}-;"
  end
  
  def find_old_sequences
    connection = ActiveRecord::Base.connection
    r = connection.execute("select relname from pg_class where relkind='S'")
    s = []
    r.each {|o| s << o['relname']}
    cs= {}
    ContextSample.all.each{|c| cs["#{c.ContextSampleID.gsub('.','_').downcase}_seq"] = true}
    b = []
    s.each do |o| 
      if cs[o] == nil
        b << o
      end
    end
    orphaned = []
    b.each do |o|
      if o.match(/^[0-9]/)
        orphaned << o
      end
    end
    orphaned.sort.each do |o| 
      # if o.index('.') != nil
        connection.execute("drop sequence \"#{o}\"")
      # end
    end
  end
end
