class TokenController < ApplicationController

  # 评委登录
  # 传入两个参数 judge_name,password
  def login
    # 获取post中的name和pwd
    user = getUser(params[:username],params[:password])
    # 判断成功签发token
    if  user
      exp = Time.now.to_i + 3600
      payload = {
                  id: user.id,
                  exp: exp
      }
      # 生成token
      token =  JWT.encode payload,Rails.application.secrets.secret_key_base
      # 返回token
      render json: {"code":0,
                    "data":{
                      "token":token

                    },
                    "msg":"登录成功"}
    else
      render json: {"code":-1,"msg":"用户名或密码错误" }
      return
    end
  end








end

