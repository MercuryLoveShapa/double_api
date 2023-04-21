class CreateDoubleAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :double_announcements do |t|
      t.string :title ,:limit=>100  #标题
      t.text :content #内容
      t.date :publish_time #发布时间
      t.date :cancel_time #撤销时间

    end
  end
end
