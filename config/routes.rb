Rails.application.routes.draw do

  get 'parts/index'
  devise_for :users

  root to: 'trips#home'

  resources :trips, only: [:new, :create, :index, :show, :update, :delete] do
    resources :parts, only: [:create]
  end

  resources :parts, only: [:update, :delete] do
    resources :activities, only: [:create]
  end

  resources :activities, only: [:update, :delete]


  #resources :activities, except: [:create, :new, :edit, :show] do
  #  collection do
  #    get :featured
  #  end
  #end

  #resources :friends, except: [:new, :edit, :update]

end
