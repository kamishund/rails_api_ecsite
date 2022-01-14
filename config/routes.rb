Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  resources :admins
  resources :products
  resources :order

  put '/pay/:id', to: 'order#pay'
  get '/history', to: 'order#history'
  get '/summary', to: 'admins#summary'
  put '/delivered/:id', to: 'order#delivered'
 
end
