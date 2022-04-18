Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #admin
  namespace :admin do
    get "/top" => "orders#top"
    resources :items
    resources :orders, only: [:show, :update]
  end

  #public
  root :to => "public/homes#top"
  namespace :public do
    get 'homes/about'
  
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
