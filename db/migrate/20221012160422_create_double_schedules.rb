class CreateDoubleSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :double_schedules do |t|
      t.string :name ,:null=>false ,:limit=>20 #赛程名称
      t.date :begin_time  #开始时间
      t.date :end_time  #结束时间
      t.string :manner #比赛方式
      t.string :demand #比赛要求
      t.bigint :double_match_id ,:null=>false #绑定赛事id
      t.bigint :double_criteria_id,:null=>false #绑定评分标准id


    end
  end
end