class CreateSysActionPermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :sys_action_permissions do |t|
      t.string :permission_name, :limit => 120, :null => false  #权限名称
      t.string :permission_value, :limit => 120, :null => false #权限内容
      t.string :description   #说明
      t.integer :parent_id, :default => 0 #父权限id
      t.timestamps
    end
    add_index :sys_action_permissions, :permission_name
  end
end

