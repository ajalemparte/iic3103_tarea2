Rails.application.routes.draw do
  # get 'admin/index'

  # get 'landing/index'

  root 'articles#index'

  resources :articles


end
