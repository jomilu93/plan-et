Rails.application.routes.draw do
  resources :itineraries do
    resources :activities, only: :create
  end

  resources :activities, except: [:create, :new, :edit, :show] do
  collection do
    get :featured
  end
  end

  resources :friends, except: [:new, :edit, :update]

end


