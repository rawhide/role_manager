class CreateRoleManagerTables < ActiveRecord::Migration
  def self.up
    create_table :rolemanager_roles do |t|
      t.string :name, :null => false
      t.timestamps
    end
    create_table :rolemanager_authorizations do |t|
      t.integer :role_id, :null => false
      t.string  :function_code, :null => false
      t.timestamps
    end
    create_table :rolemanager_functions do |t|
      t.string :name, :null => false
      t.string :code, :null => false
      t.timestamps
    end
    create_table :rolemanager_assigns do |t|
      t.integer "<%= file_name %>_id", :null => false
      t.integer :role_id, :null => false
    end
  end

  def self.down
    drop_table :rolemanager_roles
    drop_table :rolemanager_authorizations
    drop_table :rolemanager_functions
    drop_table :rolemanager_assigns
  end
end
