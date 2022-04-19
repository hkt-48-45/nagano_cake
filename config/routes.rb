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
    resources :items
    resources :orders, only: [:show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    get "/top" => "orders#top"
  end

  #public
  root :to => "public/homes#top"
  get 'homes/about' => "public/homes#about"
  get 'homes/top' => "public/homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end