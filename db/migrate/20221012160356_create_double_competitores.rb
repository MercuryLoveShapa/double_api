class CreateDoubleCompetitores < ActiveRecord::Migration[7.0]
  def change
    create_table :double_competitors do |t|
      t.string :name ,:null=>false,:limit=>20   #选手名称
      t.string :gender , :null=>false ,:limit=>5 #性别
      t.bigint :number , :null=>false #手机号
      t.bigint :card_number , :null=>false  #身份证
      t.bigint :double_user_id #账号id
      t.bigint :double_project_id #项目id
      t.timestamps
    end
  end
end