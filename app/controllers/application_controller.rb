class ApplicationController < ActionController::API

  # 校验token的公共方法
  public
  def authenticate_request!
    # 检查请求头是否包含 Authorization 参数
    if request.headers['Authorization'].present?
      # 提取 token 并解码
      token = request.headers['Authorization'].split(' ').last
      begin
        decoded = JWT.decode token,Rails.application.secrets.secret_key_base
        @current_user = DoubleJudge.find(decoded[0]['id'])
      rescue JWT::ExpiredSignature
        render json: { "code": 401, "msg": '认证已过期'}
      rescue
        render json: { "code": 401, "msg": '无效认证'}
      end
    else
      # 如果 Authorization 参数不存在，返回错误信息
      render json: { "code":401, "msg": '未识别到正确的token' }, status: :unauthorized
    end
  end


  public
  def getUser(username,password)
    DoubleJudge.find_by(name:username,password:password)
  end



end
