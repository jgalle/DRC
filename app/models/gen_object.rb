class GenObject < ActiveRecord::Base
  self.table_name = 'tblObject'
  self.primary_key = 'ObjectID'
  
  belongs_to :project_institution, :foreign_key => 'InstitutionID'
  belongs_to :project, :foreign_key => 'ProjectID'
  belongs_to :project_name, :foreign_key => 'ProjectNameID'
  belongs_to :conserved_yes_no, :class_name => 'YesNo', :foreign_key => 'Conserved'
  belongs_to :gen_object_type, :foreign_key=> 'ObjecTypeID'
  belongs_to :gen_object_material, :foreign_key => 'ObjectMaterialID'
  belongs_to :gen_object_vessel_category, :foreign_key => 'ObjectVesselCategoryID'
  belongs_to :gen_object_ware_type, :class_name => 'CeramicWare', :foreign_key => 'ObjectWareTypeID'
  belongs_to :gen_object_manu_tech, :foreign_key => 'ObjectManuTechID'
  belongs_to :gen_object_form, :foreign_key => 'ObjectFormID'
  belongs_to :gen_object_shape, :foreign_key => 'ObjectShapeID'
  belongs_to :gen_object_completeness, :foreign_key => 'ObjectCompletenessID'
  belongs_to :basic_color, :foreign_key => 'ObjectBasicColorID'
  belongs_to :dec_basic_color, :class_name => 'GenObjectColor', :foreign_key => 'DecObjectBasicColorID'
  belongs_to :gen_object_dec_tech, :foreign_key => 'ObjectDecTechID'
  belongs_to :gen_object_dec_color, :class_name => 'GenObjectColor', :foreign_key => 'ObjectColorID'
  belongs_to :gen_object_dec_pattern, :foreign_key => 'ObjectDecPatternID'
  belongs_to :gen_object_manufacture_country, :foreign_key => 'ObjectManufactureCountryID'
  belongs_to :object_length_complete, :class_name => 'YesNo', :foreign_key => 'ObjectLengthComplete'
  belongs_to :object_width_complete, :class_name => 'YesNo', :foreign_key => 'ObjectWidthComplete'
  belongs_to :object_height_complete, :class_name => 'YesNo', :foreign_key => 'objectHeighthComplete'
  
  has_many :gen_object_locations, :foreign_key => 'ObjectLocationID'
  has_and_belongs_to_many :images, :join_table => '"tblObjectImage"', :foreign_key => 'ObjectID', :association_foreign_key => 'ImageID'
  accepts_nested_attributes_for :images
  has_many :gen_object_images, :foreign_key => 'ObjectID', :dependent => :destroy
  accepts_nested_attributes_for :gen_object_images, :allow_destroy => true
  
  
  has_many :gen_object_artifacts, :foreign_key => 'ObjectID', :dependent => :destroy
  has_many :beads, :through => :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID'
  has_many :buttons, :through => :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID'
  has_many :buckles, :through => :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID'
  has_many :glasses, :through => :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID'
  has_many :ceramics, :through => :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID'
  has_many :gen_artifacts, :through => :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID'
  has_many :tobacco_pipes, :through => :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID'
  has_many :utensils, :through => :gen_object_artifacts, :foreign_key => 'GenerateContextArtifactID'
    
  accepts_nested_attributes_for :gen_object_locations, :allow_destroy => true

  before_create :update_data
  before_save :update_timestamps

  
  def update_data
    self.DateAdded = Time.now    
  end

  def update_timestamps
    self.DateChanged = Time.now
  end
  
  #attr_accessible :object_description
end
