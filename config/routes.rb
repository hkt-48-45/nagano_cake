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
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    get "/top" => "orders#top"
  end

  #public
  root :to => "public/homes#top"
  get 'homes/about' => "public/homes#about"
  get 'homes/top' => "public/homes#top"
  resources :orders
  get "customers/:id/withdraw_confirm" => "customers#withdraw_confirm", as: "withdraw_confirm"
  patch "customers/:id/withdraw" => "customers#withdraw",as: "withdraw"
  resources :customers do
    resources :addresses
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
