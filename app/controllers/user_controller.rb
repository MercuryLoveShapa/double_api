
class UserController < ApplicationController

  before_action :authenticate_request!
  def userInfo
    render json:{"code":0,
                 "msg":"获取用户信息成功",
                 "data":{
                   "true_name":@current_user.true_name,
                   "card_number":@current_user.card_number,
                   "name":@current_user.name,
                   "email":@current_user.email,
                   "number":@current_user.number,
                   "gender":@current_user.gender,
                   "desc":@current_user.description
                    }
                }
  end


  def userChange
    true_name = params[:true_name]
    card_number = params[:card_number]
    email = params[:email]
    number = params[:number]
    gender = params[:gender]
    desc = params[:desc]
    @current_user.update(true_name: true_name,
                         card_number: card_number,
                         email: email,
                         number: number,
                         gender: gender,
                         description: desc
                         )

    if @current_user.save
      render json: {"code":0 , "msg":"您的资料已更新"}

    else
      render json: {"code":-1 , "msg":"修改信息失败" }
      return
    end
  end



end
