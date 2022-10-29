Rails.application.routes.draw do

  namespace :public do
    get 'cart_items/index'
  end
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root 'public/homes#top'
  get '/about' => 'public/homes#about'


  scope module: :public do
    # 配送先
    resources :addresses, only: [:index,:create,:edit,:update,:destroy]
    # カート
    resources :cart_items, only: [:index,:create,:update,:destroy,:destroy_all]
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip:[:registrations, :passwords],controllers:{
    sessions: "admin/sessions"
  }

  namespace :admin do
    root "homes#home"
    resources :customers, only: [:index,:show,:edit,:update]
    resources :genres
    resources :items, only: [:new,:create,:index,:show,:edit,:update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end