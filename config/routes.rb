Rails.application.routes.draw do
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  get 'public/homes/about', as: 'about'
  
  namespace :admin do
    resources :genres, only: [:edit, :create, :index, :update]
    resources :items, only: [:edit, :create, :index, :update, :show, :new]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  namespace :public do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :destroy, :destroy_all, :update]
    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
    resources :orders, only: [:index, :show, :new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
