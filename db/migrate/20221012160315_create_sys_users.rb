class CreateSysUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :sys_users do |t|
      t.string :name, :null=>false, :limit=>20  #账号
      t.string :password #密码
      t.string :true_name,  :limit=>20, :null => false  #管理员称号
      t.string :email, :limit => 50 #管理员邮箱
      t.string :description #说明
      t.string :utype #类型
      t.bigint :sys_roles_id ,:null=>false  #管理员身份id
      t.timestamps
    end
  end
end
