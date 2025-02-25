Rails.application.routes.draw do
  devise_for :users  # Devise로 사용자 인증 처리
  root 'posts#index'  # 루트 페이지를 PostsController의 index 액션으로 지정

  resources :posts, only: [:new, :create, :index, :show, :destroy, :update]  # update 추가
end
