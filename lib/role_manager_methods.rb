module RoleManagerMethods
  def has_authority?(func)
    rolemanager_funcs.include?(func.to_s)
  end

  def rolemanager_funcs
    @rolemanager_funcs ||= RoleManager::Authorization.find_by_sql("select distinct function_code from rolemanager_authorizations auth, rolemanager_assigns assigns where assigns.role_id = auth.role_id and assigns.user_id = #{self.id}").map(&:function_code)
  end

  def change_role(role)
    return unless role
    @rolemanager_funcs = RoleManager::Authorization.find_by_sql("select function_code from rolemanager_authorizations auth where auth.role_id = #{role.id}").map(&:function_code)
  end

  def flash_auth_funcs
    @rolemanager_funcs = nil
  end
end
