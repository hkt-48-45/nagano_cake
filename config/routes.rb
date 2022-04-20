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
  delete "cart_items/destroy_all" => "cart_items#destroy_all"
  resources :customers
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy]
  #get "customers/:id/withdraw_confirm" => "customers#withdraw_confirm", as: "withdraw_confirm"
  #path "customers/:id/withdraw" => "customers#withdraw",as: "withdraw"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end