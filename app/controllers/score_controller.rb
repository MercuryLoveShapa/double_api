class ScoreController < ApplicationController

  before_action :authenticate_request!
  def get_judge_match
    id = @current_user.id
    sql = "SELECT
              double_projects.name,
              double_projects.organization,
              double_projects.leader,
              double_projects.img_http
            FROM
              double_schedule_double_judges
              INNER JOIN
                double_schedules_double_projects
              ON
                double_schedule_double_judges.double_schedule_id = double_schedules_double_projects.double_schedule_id
              INNER JOIN
                double_projects
              ON
                double_projects.id = double_schedules_double_projects.double_project_id
            WHERE
              double_schedule_double_judges.double_judge_id = #{id}"

    project_list = DoubleSchedulesDoubleJudge.find_by_sql(sql)
    render json: {"code":0,"data":project_list,"msg":"成功"}
  end


  # 获取对应赛程的项目
  # 传入参数_schedule_id
  def get_project_list
    schedule_id = params[:schedule_id]
    # 获取赛程的赛事列表
    @project= DoubleProject.find_by_sql(" SELECT double_projects.id,name,organization,leader
                                                FROM double_projects
                                                INNER JOIN
                                                double_schedules_double_projects ON id = double_project_id
                                                WHERE double_schedule_id = "<< schedule_id)
    render json: @project_list
  end


  # 获取项目信息
  # 传参 project_id
  def project_show
    project_id = params[:project_id]
    @project_msg = DoubleProject.find_by(id:project_id)
    render json: {"data":@project_msg}
  end

end