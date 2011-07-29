class RoleManager::Assign < ActiveRecord::Base
  set_table_name 'rolemanager_assigns'
  belongs_to :role, :class_name => 'RoleManager::Role', :foreign_key => :role_id
end
