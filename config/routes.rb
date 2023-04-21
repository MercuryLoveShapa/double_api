Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #
  # root "token#judge_login"
  # get请求
    # 获取公告API
    get "/api/announcement", to:  'announcement#announcement_title'
    # 获取公告内容API
    get "api/announcementContent",to: 'announcement#get_announcement'
    # 获取个人信息
    get "/api/userinfo", to: 'user#userInfo'
    # 获取赛事列表
    get "/api/matchList", to: 'list_of_match#get_match_list'
    # 获取赛程列表
    get "/api/match", to: 'list_of_match#get_schedule_list'
    # 获取待打分项目列表
    get "/api/scoreList",to: 'score#get_judge_match'





  # post请求
    # 登录获取tokenAPI
    post "/api/login" , to: 'token#login'
    # 修改个人信息API
    post "/api/userchange", to:  'user#userChange'
    # 校验账号密码与修改密码
    post "/api/verification", to: 'changepwd#verification'
    post "/api/changepwd", to: 'changepwd#changePwd'




end
