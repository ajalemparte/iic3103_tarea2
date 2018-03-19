Rails.application.routes.draw do
  # get 'admin/index'

  # get 'landing/index'

  get 'articles/admin' => 'articles#admin', :as => :admin_articles


  root 'articles#index'

  resources :articles do
  	resources :comments
  end

end
