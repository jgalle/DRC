class CeramicDecTech < ActiveRecord::Base
  self.table_name = 'tblCeramicDecTech'
  self.primary_key = 'CeramicDecTechID'
  before_save :set_artifact_id
  
  # #attr_accessible :artifact_id, :generate_context_artifact_id
  
  belongs_to :ceramic, :foreign_key => 'GenerateContextArtifactID'
  belongs_to :ceramic_dec_tech_type, :foreign_key => 'CeramicDecColorTypeID'
  belongs_to :mun_app_color, :class_name => 'MunsellAppliedColor'
  belongs_to :interior_exterior, :class_name => 'CeramicDecTechInteriorExterior'
  belongs_to :ceramic_dec_tech_location, :foreign_key => 'CeramicDecTechLocationID'
  belongs_to :ceramic_dec_tech_sty_element, :foreign_key => 'CeramicDecTechStyElemID'
  belongs_to :ceramic_dec_tech_motif, :foreign_key => 'CeramicDecTechMotifID'
  
  def set_artifact_id
    # debugger
    if self.ArtifactID == nil
      # self.ArtifactID = self.ceramic.ArtifactID
    end
  end
end
