class CreateSysRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :sys_roles do |t|
      t.string :role_name #角色名称
      t.string :description #说明
    end
  end
end