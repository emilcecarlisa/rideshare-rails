Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :drivers

  resources :passengers do
    resources :trips, only: [:new]
  end
  
  resources :trips

end
