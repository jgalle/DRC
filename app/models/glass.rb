class Glass < ActiveRecord::Base
  self.table_name = 'tblGlass'
  self.primary_key = 'GenerateContextArtifactID'

  belongs_to :glass_material, :foreign_key => 'GlassMaterialID'
  # belongs_to :glass_color, :foreign_key => 'GlassColorID'
  belongs_to :glass_vessel_category, :foreign_key => 'GlassVesselCategoryID'
  belongs_to :glass_form, :foreign_key => 'GlassFormID'
  belongs_to :glass_completeness, :foreign_key => 'GlassCompletenessID'
  belongs_to :glass_manu_tech, :foreign_key => 'GlassManuTechID'
  belongs_to :glass_mold_type, :foreign_key => 'MoldTypeID'
  belongs_to :pmm_yes_no, :class_name => 'YesNo', :foreign_key => 'PMM'
  belongs_to :glass_pontil_mark, :foreign_key => 'PontilMarkID'
  belongs_to :glass_stemware_body_shape, :foreign_key => 'StemwareBodyShapeID'
  belongs_to :glass_stemware_foot_shape, :foreign_key => 'StemwareFootShapeID'
  belongs_to :glass_stem_shape, :foreign_key => 'StemShapeID'
  # belongs_to :glass_weathered_eroded_yes_no, :class_name => 'YesNo', :foreign_key => 'GlassWeatheredEroded'
  belongs_to :burned_yes_no, :class_name => 'YesNo', :foreign_key => 'Burned'
  belongs_to :patination_yes_no, :class_name => 'YesNo', :foreign_key => 'Patination'
  belongs_to :solarized_yes_no, :class_name => 'YesNo', :foreign_key => 'Solarized'
  belongs_to :mended_yes_no, :class_name => 'Mended', :foreign_key => 'MendedYNID'
  belongs_to :generate_context_artifact, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  belongs_to :created_by, :class_name => 'Editor', :foreign_key => 'EditorIDN'
  belongs_to :updated_by, :class_name => 'Editor', :foreign_key => 'EditorID'
  belongs_to :basic_color, :class_name => "BasicColor", :foreign_key => "GlassBasicColorID"
  belongs_to :decoration_yes_no, :class_name => 'YesNo', :foreign_key => 'DecorationYN'
  
  has_many :glass_dec_techs, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  has_many :glass_marks, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  has_many :glass_bottles, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  
  has_one :context_sample, :through => :generate_context_artifact, :foreign_key => 'ContextSampleID'
  has_one :context, :through => :context_sample, :foreign_key => 'ContextID'
  has_one :project, :through => :context, :foreign_key => 'ProjectID'
  
  has_many :glass_mends, :foreign_key => 'ArtifactID'

  has_many :artifact_images, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :artifact_images, :allow_destroy => true

  has_many :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID', :dependent => :destroy
  accepts_nested_attributes_for :gen_object_artifacts, :allow_destroy => true
  
  validates :SherdThickness, numericality: true, allow_nil: true
  validates :SherdSize, numericality: true, allow_nil: true
  validates :SherdWeight, numericality: true, allow_nil: true
  validates :LengthofRim, numericality: true, allow_nil: true
  validates :RimDiameter, numericality: true, allow_nil: true
  validates :MendedRimDiameter, numericality: true, allow_nil: true
  validates :BaseLength, numericality: true, allow_nil: true
  validates :BaseDiameter, numericality: true, allow_nil: true
  validates :MendedBaseDiameter, numericality: true, allow_nil: true
  validates :StemLength, numericality: true, allow_nil: true
  validates :TotalContainerHeight, numericality: true, allow_nil: true
  validates :Quantity, numericality: { only_integer: true }
  
  validates_presence_of :GlassBasicColorID
  
  validate :check_sherd_thickness
  def check_sherd_thickness
    if ((self.SherdSize != nil) and (!((self.SherdSize.to_i % 5) == 0 )))
      errors.add('SherdSize', 'must be divisible by 5') 
    end
  end
  
  
  accepts_nested_attributes_for :glass_dec_techs, :allow_destroy => true
  accepts_nested_attributes_for :glass_marks, :allow_destroy => true
  accepts_nested_attributes_for :glass_bottles, :allow_destroy => true
  accepts_nested_attributes_for :glass_mends, :allow_destroy => true
  
  
  #attr_accessible :artifact_id
  
  before_create :update_data
  before_save :set_artifact_id
  before_save :update_timestamps
  after_save :set_child_artifact_ids

  def set_child_artifact_ids
    self.glass_dec_techs.each do |bc|
      bc.ArtifactID = self.ArtifactID
      bc.save
    end
    self.glass_marks.each do |bc|
      bc.ArtifactID = self.ArtifactID
      bc.save
    end
    self.glass_bottles.each do |bc|
      bc.ArtifactID = self.ArtifactID
      bc.save
    end
  end

  def set_artifact_id
    self.ArtifactID = self.generate_context_artifact.ArtifactID if self.generate_context_artifact != nil
    self.gen_object_artifacts.each do |obj|
      obj.ArtifactID = self.ArtifactID
      obj.save
    end
  end
  
  def update_data
    self.generate_context_artifact.set_artifact_id
    # don't cache !!!
    self.ArtifactID = GenerateContextArtifact.find(self.generate_context_artifact.id).ArtifactID if self.generate_context_artifact != nil
    # self.ArtifactID = self.generate_context_artifact.ArtifactID if self.generate_context_artifact != nil
    self.DateAdded = Time.now    
    # self.DateChanged = Time.now    
    # self.save
  end
  def update_timestamps
    self.DateChanged = Time.now
  end
  
end
