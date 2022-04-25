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
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :orders
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_details, only: [:update]

  end

  #public
  root :to => "public/homes#top"
  get 'homes/about' => "public/homes#about"
  delete "cart_items/destroy_all" => "cart_items#destroy_all"
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy]
  post "orders/confirm" => "orders#confirm", as: "order_confirm"
  get "orders/complete" => "orders#complete", as: "order_complete"
  get 'homes/top' => "public/homes#top"
  resources :orders, except:[:update]
  get "customers/:id/withdraw_confirm" => "customers#withdraw_confirm", as: "withdraw_confirm"
  patch "customers/:id/withdraw" => "customers#withdraw",as: "withdraw"
  resources :addresses
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
