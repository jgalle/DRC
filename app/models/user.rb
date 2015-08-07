class User < ActiveRecord::Base
  acts_as_messageable
  
  belongs_to :editor
  belongs_to :project_institution, :foreign_key => 'organization_id'
  # has_and_belongs_to_many :projects, :join_table => 'users_projects', :association_foreign_key => 'project_by_inst_id'
  has_many :activities
  has_many :user_permissions
  # deletable projects
  has_many :projects, :class_name => 'Project', :through => :user_permissions  #, :conditions => "user_level >= 2"
  # has_many :deletable_projects, :class_name => 'Project', :through => :projects, :conditions => "user_level >= 2"
  accepts_nested_attributes_for :user_permissions, :allow_destroy => true
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable#, :registerable,:recoverable

  after_create :add_editor
  # Setup accessible (or protected) attributes for your model
  # attr_accessible :first_name, :last_name, :userid, :organization_id, :editor_id, :user_level, :email, :password, :password_confirmation, :remember_me, :projects, :project_ids
  # #attr_accessible :title, :body
    
  def self.current
    Thread.current[:user]
  end
  def self.current=(user)
    Thread.current[:user] = user
  end
  
    def deletable_projects
      projects = []
      if !self.is_admin?
        self.user_permissions.where("user_level >= 2").each {|up| projects += up.projects }
      else
        projects = Project.all
      end
      return projects
    end

    def edit_projects
      projects = []
      if !self.is_admin?
        self.user_permissions.where("user_level >= 1").each {|up| projects += up.projects }
      else
        projects = Project.all
      end
      return projects
    end
    
    def admin_projects
      projects = []
      # self.user_permissions.where("user_level >= 3").each {|up| projects += up.projects }
      if self.is_admin?
        projects = Project.all
      end
      return projects
    end
    
    def is_editor?
      self.user_permissions.where("user_level >= 1").size >= 1
    end

    def is_admin?
      self.user_permissions.where("user_level >= 3").size >= 1
    end

    def is_super_admin?
      self.user_permissions.where("user_level > 3").size >= 1
    end
    
    def add_editor
      if self.editor_id == nil
        self.editor = Editor.create
        self.save
      end
    end

    
end
