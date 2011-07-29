class ActiveRecord::Base
  def self.acts_as_role
    has_many :assigns, :class_name => 'RoleManager::Assign', :foreign_key => "#{self.superclass.to_s.downcase}_id"
    has_many :roles, :class_name => 'RoleManager::Role', :through => :assigns
    include RoleManagerMethods
  end
end
