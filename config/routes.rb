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
  end

  #public
  root :to => "public/homes#top"
  namespace :public do
    get 'homes/about'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html




















resources:customers
# get "public/customers/edit" => "public/customers#edit"
# get "public/customers" => "public/customers#show"
# patch "public/customers" => "public/customers#update"
# 退会確認画面
get 'customers/:id/withdraw_confirm' => 'customers#withdraw_confirm', as: 'withdraw_confirm'
# 論理削除用のルーティング
patch 'customers/:id/withdraw' => "customers#withdraw", as: 'withdraw'
end
