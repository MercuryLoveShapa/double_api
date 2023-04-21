class ListOfMatchController < ApplicationController

  before_action :authenticate_request!

  def get_match_list
    page  = params[:page]

    # 分页获得赛事数据
    @match_list = DoubleMatch.page(page).per(10)
    total = DoubleMatch.count
    if @match_list == nil
      render json: {"code":-1,"msg":"此赛事不存在"}
      return
    end
    render json: {"code":0,"msg":"success","data":@match_list,"total":total }
    return
  end

  # 获得赛事赛程列表
  # 传入参数 id
  def get_schedule_list
    match_id = params[:id]

    # sql语句
    match_sql = "select * from double_matches where id = " + match_id
    schedule_sql = "select * from double_schedules where double_match_id =" + match_id
    # 查询赛事所有信息
    @match_msg = DoubleMatch.find_by_sql(match_sql)
    # 查询赛事相关的所有赛程
    @schedule_list = DoubleSchedule.find_by_sql(schedule_sql)
    if @match_msg == nil
      render json: {"code":-1,"msg":"未找到对应赛事"}
      return
    end
    render json: {"code":0,
                  "data":{
                    "scheduleList":@schedule_list,
                    "match_msg":@match_msg[0]
                  },
                  "msg":"success"
    }
    return
  end





end