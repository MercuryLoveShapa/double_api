class CollectionController < ApplicationController

  # 收藏新项目
  def create_collection
    project_id = [:project_id]
    judge_id  = get_judge_id
    judge_project = DoubleJudgesDoubleProjectsConcerrn.create(double_judge_id: judge_id , double_project_id:project_id)
    if judge_project
      render json: {"code":1,"msg":"已收藏该项目"}
    else
      render json: {"code":-1,"msg":"收藏失败"}
    end

    # 获取收藏的项目列表
    def get_collection_project
      judge_id = get_judge_id
      # @project_list =
    end
  end
end
