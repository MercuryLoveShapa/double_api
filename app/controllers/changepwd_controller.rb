class ChangepwdController < ApplicationController
  before_action :authenticate_request!
  # 校验账号密码
  def verification
    username = @current_user.name
    password = params[:password]
    user = getUser(username,password)
    if user
      render json: {"code":0,"msg":"账号密码验证成功"}
    else
      render json: {"code":-1 ,"msg":"请输入正确的账号密码"}
      return
    end
  end

  # before_action :authenticate_request!
  # 修改密码
  def changePwd
    new_password = params[:password]
    if new_password == @current_user.password
      render json: {"code":-1,"msg":"修改的密码不能与原密码相同！"}
      return

    end
    @current_user.update(password: new_password)
    if @current_user.save
      render json: {"code":0,"msg":"您的密码已修改"}
    else
      render json: {"code":-1,"msg":"系统错误，修改密码失败"}
      return
    end
  end
end
