Rails.application.routes.draw do
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
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
    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    patch 'customers/update_status'
    delete 'cart_items/destroy_all'
    post 'orders/confirm'
    get 'orders/complete', as: 'complete'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :destroy, :destroy_all, :update]
    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
    resources :orders, only: [:index, :show, :new, :create]
  end

  namespace :admin do
    resources :customers, only: [:edit, :index, :update, :show]
    resources :genres, only: [:edit, :create, :index, :update]
    resources :items, only: [:edit, :create, :index, :update, :show, :new]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
