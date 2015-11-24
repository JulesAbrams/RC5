Rails.application.routes.draw do
  root 'rc5s#new'

  resources :rc5s

end