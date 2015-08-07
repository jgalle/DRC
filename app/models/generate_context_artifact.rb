class GenerateContextArtifact < ActiveRecord::Base
  self.table_name = 'tblGenerateContextArtifactID'
  self.primary_key = 'GenerateContextArtifactID'
  #attr_accessible :artifact_id, :context_sample_id
  
  belongs_to :context_sample, :foreign_key => 'ContextSampleID'
  has_one :bead, foreign_key: 'GenerateContextArtifactID'#, :dependent => :destroy
  has_one :bone, foreign_key: 'GenerateContextArtifactID'#, :dependent => :destroy
  has_one :button, foreign_key: 'GenerateContextArtifactID'#, :dependent => :destroy
  has_one :buckle, foreign_key: 'GenerateContextArtifactID'#, :dependent => :destroy
  has_one :ceramic, foreign_key: 'GenerateContextArtifactID'#, :dependent => :destroy
  has_one :glass, foreign_key: 'GenerateContextArtifactID'#, :dependent => :destroy
  has_one :gen_artifact, foreign_key: 'GenerateContextArtifactID'#, :dependent => :destroy
  has_one :tobacco_pipe, foreign_key: 'GenerateContextArtifactID'#, :dependent => :destroy
  has_one :utensil, foreign_key: 'GenerateContextArtifactID'#, :dependent => :destroy

  # scope :without_artifacts, joins('left outer joins')
  # @lock = File.new(File.join(Rails.root, 'app','locks','artifact_id'))
  
  after_create :report_id
  
  def report_id
    logger.info "--------------> created new GenerateContextArtifactID = #{self.id} by #{User.current.userid}"
  end
  # after_create :set_artifact_id
  
  def set_artifact_id
    # if context_sample != nil and context_sample.ContextSampleID == '9999-1-A-DRS-;'
      begin
        # @lock.flock(File::LOCK_EX)
        GenerateContextArtifact.connection.update("update \"tblGenerateContextArtifactID\" set \"ArtifactID\"='#{context_sample.ContextSampleID.gsub(';','')}-'||to_char(nextval('#{context_sample.ContextSampleID.gsub('.','_').downcase}_seq'),'FM09999') where \"GenerateContextArtifactID\"=#{self.id}")
      ensure
        # @lock.flock(File::LOCK_UN)
      end
    # else
    #   lock = File.new(File.join(Rails.root, 'app','locks','artifact_id'))
    #   max_artifact_id = nil
    #   begin
    #     lock.flock(File::LOCK_EX)
    #     open(File.join(Rails.root, 'app','locks','artifact_id.log'), 'a') { |f|
    #       f.puts "===================lock on #{self.id} (#{Time.now.to_f})"
    #     }
    #     max_artifact_id = GenerateContextArtifact.where('ContextSampleID' => self.context_sample).maximum('ArtifactID')
    #     # max_artifact_id = GenerateContextArtifact.where('ContextSampleID' => self.context_sample).order('"ArtifactID" desc').limit(1).first.ArtifactID
    #   
    #     open(File.join(Rails.root, 'app','locks','artifact_id.log'), 'a') { |f|
    #       f.puts "===================== #{self.id} found max #{max_artifact_id} (#{Time.now.to_f})"
    #     }
    #   
    #     # debugger
    #     if max_artifact_id != nil
    #       max_artifact_id = max_artifact_id.split('-').last.to_i + 1
    #     else
    #       max_artifact_id = 1
    #     end
    #     self.ArtifactID = "#{self.ContextSampleID.gsub(';','-')}#{max_artifact_id.to_s.rjust(5,'0')}"
    #     # debugger
    #     self.save
    #     sleep 0.3
    #     max_artifact_id = GenerateContextArtifact.where('ContextSampleID' => self.context_sample).maximum('ArtifactID')
    #     open(File.join(Rails.root, 'app','locks','artifact_id.log'), 'a') { |f|
    #       f.puts "=====================  #{self.id} new max #{max_artifact_id} (#{Time.now.to_f})"
    #     }
    #     # do your logic here, or share information in your lock file
    #   ensure
    #     lock.flock(File::LOCK_UN)
    #     open(File.join(Rails.root, 'app','locks','artifact_id.log'), 'a') { |f|
    #       f.puts "===================  unlocked on #{self.id} with max #{max_artifact_id} (#{Time.now.to_f})"
    #     }
    #   end
    # end
      # GenerateContextArtifact.transaction do
      #   max_artifact_id = GenerateContextArtifact.where('ContextSampleID' => self.context_sample).maximum('ArtifactID')
      #   # debugger
      #   if max_artifact_id != nil
      #     max_artifact_id = max_artifact_id.split('-').last.to_i + 1
      #   else
      #     max_artifact_id = 1
      #   end
      #   self.ArtifactID = "#{self.ContextSampleID.gsub(';','-')}#{max_artifact_id.to_s.rjust(5,'0')}"
      #   # debugger
      #   self.save
      # end
  end
  
  def orphaned_gcas
    g = GenerateContextArtifact.includes(:bead, :button, :buckle, :bone, :ceramic, :glass, :gen_artifact, :tobacco_pipe, :utensil).where(:tblBead => {:GenerateContextArtifactID => nil}, :tblButton => {:GenerateContextArtifactID => nil}, :tblBuckle => {:GenerateContextArtifactID => nil}, :tblBone => {:GenerateContextArtifactID => nil}, :tblCeramic => {:GenerateContextArtifactID => nil}, :tblGlass => {:GenerateContextArtifactID => nil}, :tblGenArtifact => {:GenerateContextArtifactID => nil}, :tblTobaccoPipe => {:GenerateContextArtifactID => nil}, :tblUtensil => {:GenerateContextArtifactID => nil})
    g.each {|o| o.destroy}
  end
end
