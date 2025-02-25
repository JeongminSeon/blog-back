Rails.application.routes.draw do
  # devise_for :users  # 사용자 인증 관련 라우팅 추가

  root "posts#index"  # 홈페이지(기본 페이지) 설정

  resources :posts  # CRUD를 위한 기본적인 RESTful 라우팅
end
