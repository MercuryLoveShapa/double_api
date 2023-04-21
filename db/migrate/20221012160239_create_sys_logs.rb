class CreateSysLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :sys_logs do |t|
      t.string  :utype, :limit => 100 #用户类型
      t.string  :username, :limit => 100 #用户名
      t.string  :ip_addr, :limit => 100 #ip地址
      t.string  :action_type, :limit => 100 #操作类型
      t.timestamps
    end
  end
end