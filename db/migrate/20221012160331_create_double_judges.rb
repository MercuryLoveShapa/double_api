class CreateDoubleJudges < ActiveRecord::Migration[7.0]
  def change
    create_table :double_judges do |t|
      t.string :name ,:null => false, :limit=> 40   #账号
      t.string :password  #密码
      t.string :email ,:null => false, :limit=>50 #邮箱
      t.string :true_name , :null=>false, :limit =>20 #评委昵称
      t.bigint :number ,:null=>false #评委电话号
      t.string :card_number , :null=>false ,:limit=>40  #身份证号
      t.integer :gender , :null=>false ,:limit=>5 #性别
      t.string :description #说明
      t.bigint :sys_roles_id ,:null=>false  #评委身份id
      t.timestamps
    end
  end
end

