class CreateDoubleJudgesDoubleProjectsConcerrns < ActiveRecord::Migration[7.0]
  def change
    create_table :double_judge_double_project_concerns,:id => false do |t|
      t.column :double_judge_id, :integer
      t.column :double_project_id, :integer

    end
  end
end