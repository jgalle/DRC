class UserPermission < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :projects, :join_table => 'user_permissions_projects'
end
