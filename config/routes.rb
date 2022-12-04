Rails.application.routes.draw do
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  root to: 'public/homes#top'
  get 'admin' => 'admin/homes#top', as: 'admin'

  scope module: :public do
    get 'about' => 'homes#about', as: 'about'
    get 'customers/confirm'
    patch 'customers/update_status', as: 'update_status'
    delete 'cart_items/destroy_all', as: 'destroy_all'
    post 'orders/confirm'
    get 'orders/complete', as: 'complete'
  end

  namespace :admin do
    resources :customers, only: [:edit, :index, :update, :show]
    resources :genres, only: [:edit, :create, :index, :update]
    resources :items, only: [:edit, :create, :index, :update, :show, :new]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  namespace :public do
    resources :customers, only: [:edit, :update, :show]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :destroy, :destroy_all, :update]
    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
    resources :orders, only: [:index, :show, :new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
