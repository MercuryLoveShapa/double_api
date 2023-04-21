class CreateDoubleIndustries < ActiveRecord::Migration[7.0]
  def change
    create_table :double_industries do |t|
      t.string :industry #行业名称
    end
  end
end
