class AnnouncementController < ApplicationController

  before_action :authenticate_request!

  # 读取当前时间，返回未超时的通知的id与标题
  def announcement_title
    now = Time.now
    time = now.strftime("%Y-%m-%d")
    sql  = 'select id,title from double_announcements where publish_time< "'+time +  '" and cancel_time>"' + time + '"'
    announcement_list =  DoubleAnnouncement.find_by_sql(sql)
    render  json:{"code":0,"data": announcement_list,"username":@current_user.true_name}
    return
  end


  # 获取公告id所在公告的信息，渲染
  # 传参 id
  def get_announcement
    announcement_id = params[:id]
    print("==============")
    print(announcement_id)
    @announcement = DoubleAnnouncement.find_by(id:announcement_id)
    if @announcement == nil
      render json: {"code":-1 , "msg":"warring" }
      return
    end
    render json: {"code":0 , "data": @announcement,"msg":"success"}
    return
  end
end
