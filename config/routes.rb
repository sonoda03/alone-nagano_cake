Rails.application.routes.draw do
  root 'public/homes#top'
  get '/about' => 'public/homes#about'

  namespace :public do

  end
  devise_for :admins



  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
