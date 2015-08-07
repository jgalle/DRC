class Image < ActiveRecord::Base
  self.table_name = 'tblImage'
  self.primary_key = 'ImageID'
  #attr_accessible :catalogue_number, :date_added, :document_id, :editor_idn, :image_description, :image_file_location, :image_type_id, :institution
  belongs_to :image_type, :foreign_key => 'ImageTypeID'
  belongs_to :image_file_format, :foreign_key => 'ImageFileFormatID'
  belongs_to :image_form, :foreign_key => 'ImageFormID'
  belongs_to :image_material, :foreign_key => 'ImageMaterialID'
  belongs_to :image_subtype, :foreign_key => 'ImageSubtypeID'
  belongs_to :project_institution, :foreign_key => 'InstitutionID'
  
  # has_and_belongs_to_many :projects, :join_table => 'tblProjectSiteImage', :foreign_key => 'ImageID'
  has_and_belongs_to_many :projects, :join_table => 'images_projects'
  
  has_many :artifact_images, :foreign_key => 'ImageID', :dependent => :destroy
  has_many :beads, :through => :artifact_images
  has_many :buttons, :through => :artifact_images
  has_many :buckles, :through => :artifact_images
  has_many :glasses, :through => :artifact_images
  has_many :gen_artifacts, :through => :artifact_images
  has_many :tobacco_pipes, :through => :artifact_images
  has_many :utensils, :through => :artifact_images
  
  has_many :context_images, :foreign_key => 'ImageID', :dependent => :destroy
  has_many :contexts, :through => :context_images
  
  has_and_belongs_to_many :project_site_maps, :class_name => 'Project', :join_table => 'tblProjectSiteImage',  :association_foreign_key => 'ProjectID', :foreign_key => 'ImageID'
  # has_many :project_images, :foreign_key => 'ImageID', :dependent => :destroy
  # has_many :project_site_maps, :class_name => 'Project', :through => :project_images
  
  has_many :gen_object_images, :foreign_key => 'ImageID'
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
  validates_presence_of :ImageTypeID
  validates_presence_of :ImageSubtypeID
  
  before_save :copy_photo
  before_save :update_timestamps
  after_create :copy_photo_save
  
  def copy_photo
    self.ImageFileLocation = self.photo.url.split('?').first if self.photo_file_name != nil
  end
  def copy_photo_save
    copy_photo
    self.save
  end
  def update_timestamps
    self.DateChanged = Time.now
  end

end
