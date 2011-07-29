class RoleManager::Role < ActiveRecord::Base
  set_table_name 'rolemanager_roles'
  has_many :authorizations, :class_name => 'RoleManager::Authorization', :foreign_key => :role_id
  has_many :assigns, :class_name => 'RoleManager::Assign', :foreign_key => :role_id

  def add_authority(func)
    raise ArgumentError,'not found this func' if RoleManager::Function.first(:conditions => ['code = ?', func]).blank?
    RoleManager::Authorization.create(:role_id => self.id, :function_code => func.to_s)
  end
end
