class ActionController::Base
  def current_user
    raise NotImplementedError
  end

  def has_authority?(func)
    session[:functions] ||= current_user.rolemanager_funcs
    session[:functions].include? func.to_s
  end

  def self.role_filter(func,options={})
    before_filter options do |controller|
      unless controller.send(:current_user).has_authority?(func)
        raise PermissionError
      end
    end
  end
end
class PermissionError < StandardError; end;
