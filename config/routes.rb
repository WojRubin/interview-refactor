Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  mount_devise_token_auth_for 'User', at: 'auth'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  # root to: 'application#react'

  resources :tv_shows do
  	resources :episodes, :shallow => true
  end
end
