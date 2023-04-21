class CreateDoubleCriteria < ActiveRecord::Migration[7.0]
  def change
    create_table :double_criteria do |t|
      t.string :name ,:limit=>20  #评分姓名
      t.string :value #评分内容
      t.float :score ,:limit=>10  #评分标准
    end
  end
end
