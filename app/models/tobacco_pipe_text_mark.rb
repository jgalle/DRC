class TobaccoPipeTextMark < ActiveRecord::Base
  self.table_name = 'tblTobaccoPipeTextMark'
  self.primary_key = 'TobaccoPipeTextMarkID'
  
  belongs_to :tobacco_pipe_text_mark_type, :foreign_key => 'TextMarkTypeID'
  belongs_to :tobacco_pipe_motif_text_location, :foreign_key => 'MotifTextLocationID'
  belongs_to :tobacco_pipe_text_frame_motif, :foreign_key => 'PipeTextFrameMotifID'
  belongs_to :tobacco_pipe, :foreign_key => 'GenerateContextArtifactID'
  
  #attr_accessible :artifact_id, :first_name, :generate_context_artifact_id, :last_name, :mark_notes, :motif_text_location_id, :pipe_text_frame_motif_id, :place_name, :slogan_other, :text_mark_type_id
  before_save :update_artifact_id

  def update_artifact_id
    self.ArtifactID = self.tobacco_pipe.ArtifactID
  end
end
