class CreateDoubleSchedulesDoubleProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :double_schedules_double_projects,:id => false do |t|
      t.column :double_schedule_id, :integer
      t.column :double_project_id, :integer
    end
    add_index :double_schedules_double_projects,
              [:double_schedule_id,:double_project_id],
              :unique=> true,
              :name=>"index_double_schedule_double_projects"
  end
end

