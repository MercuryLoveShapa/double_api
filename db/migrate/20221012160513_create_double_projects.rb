class CreateDoubleProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :double_projects do |t|
      t.string :name,:null=>false,:limit=> 40 #项目名称
      t.text :description   #项目说明
      t.string :organization , :limit=>20 #所属单位
      t.string :leader ,:limit=>10  #主要联系人
      t.bigint :leader_number  #联系电话

      t.bigint :double_industry_id #所属行业
    end
  end
end
