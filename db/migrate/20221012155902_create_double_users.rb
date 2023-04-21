class CreateDoubleUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :double_users do |t|
      t.string :name ,:null => false, :limit=> 40   #选手账号
      t.string :password
      t.string :email ,:null => false, :limit=>50 #选手邮箱
      t.string :true_name , :null=>false, :limit =>20 #选手昵称
      t.bigint :number ,:null=>false #选手电话号
      t.bigint :sys_roles_id ,:null=>false  #选手身份id
      t.timestamps
    end
  end
end
