class CreateDoubleMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :double_matches do |t|
      t.string :name
      t.string :theme ,:limit=>50 #赛事主题
      t.string :area , :limit=>50 #赛事地区
      t.string :reward #赛事奖励
      t.date :begin_time
      t.date :end_time
    end
  end
end
