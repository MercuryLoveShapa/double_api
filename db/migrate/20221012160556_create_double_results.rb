class CreateDoubleResults < ActiveRecord::Migration[7.0]
  def change
    create_table :double_results do |t|
      t.float :grade  #成绩
      t.string :comment #评委寄语
      t.boolean :promotion #是否晋级

      t.bigint :double_project_id #绑定项目id
      t.bigint :double_judge_id #评委id
      t.bigint :double_schedule_id #赛程id
    end
  end
end

