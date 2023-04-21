class CreateDoubleSchedulesDoubleJudges < ActiveRecord::Migration[7.0]
  def change
    create_table :double_schedule_double_judges,:id => false  do |t|
      t.column :double_schedule_id, :integer
      t.column :double_judge_id, :integer
    end

  end
end