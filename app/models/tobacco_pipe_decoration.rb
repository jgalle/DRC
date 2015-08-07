class TobaccoPipeDecoration < ActiveRecord::Base
  self.table_name = 'tblTobaccoPipeDecoration'
  self.primary_key = 'TobaccoPipeDecID'
  
  belongs_to :tobacco_pipe_dec_motif, :foreign_key => 'TobaccoPipeDecMotifID'
  belongs_to :tobacco_pipe_motif_text_location, :foreign_key => 'MotifTextLocationID'
  belongs_to :tobacco_pipe_motif_manu_tech, :foreign_key => 'TobaccoPipeMotifManuTechID'
  belongs_to :tobacco_pipe, :foreign_key => 'GenerateContextArtifactID'

  validates_presence_of :TobaccoPipeDecMotifID
  #attr_accessible :generate_context_artifact_id, :motif_text_location_id, :notes, :tobacco_pipe_dec_motif_id, :tobacco_pipe_motif_manu_tech_id

  before_save :update_artifact_id

  def update_artifact_id
    self.ArtifactID = self.tobacco_pipe.ArtifactID
  end

end
