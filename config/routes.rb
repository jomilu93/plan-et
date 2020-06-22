Rails.application.routes.draw do

  get 'others/show'
  get 'others/destroy'
  get 'transportations/show'
  get 'transportations/destroy'
  get 'attractions/show'
  get 'attractions/destroy'
  get 'accomodations/show'
  get 'accomodations/destroy'
  get 'meals/show'
  get 'meals/destroy'
  get 'parts/index'
  devise_for :users

  post 'trips/:id/private' , to: 'trips#turnprivate', as: :privatise

  root to: 'trips#home'

  resources :trips, only: [:new, :create, :index, :show, :update, :destroy] do
    resources :parts, only: [:create]
    # resources :meals, only: [:create]
    # resources :accomodations, only: [:create]
  end

  resources :parts, only: [:update, :destroy] do
    resources :activities, only: [:create]
  end

  resources :activities, only: [:update, :destroy] do |variable|
  end



  # resources :users, only: [:show, :edit, :update]

  #resources :activities, except: [:create, :new, :edit, :show] do
  #  collection do
  #    get :featured
  #  end
  #end

  #resources :friends, except: [:new, :edit, :update]

end
