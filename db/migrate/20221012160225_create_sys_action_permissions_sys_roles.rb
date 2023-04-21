class CreateSysActionPermissionsSysRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :sys_action_permissions_sys_roles,:id=>false do |t|
      t.integer :sys_action_permission_id #权限id
      t.integer :sys_role_id  #角色id
    end
    #建立索引
    add_index :sys_action_permissions_sys_roles,
              [:sys_action_permission_id,:sys_role_id],
              :unique => true,
              :name => "index_sys_action_permissions_sys_roles_permissions_roles"
  end
end
