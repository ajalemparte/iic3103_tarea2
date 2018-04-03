Rails.application.routes.draw do

 	root 'articles#index'
  # get 'articles/admin' => 'articles#admin', :as => :admin_articles
  get 'articles' => 'articles#index'
  put 'articles' => 'articles#create'
  get 'articles/:id' => 'articles#show'
  delete 'articles/:id' => 'articles#destroy'
		put 'articles/:id' => 'articles#update'  
		patch 'articles/:id' => 'articles#update'

		get 'articles/:id/comments' => 'comments#index'
  put 'articles/:id/comments' => 'comments#create'
  get 'articles/:id/comments/:comment_id' => 'comments#show'
  delete 'articles/:id/comments/:comment_id' => 'comments#destroy'
		put 'articles/:id/comments/:comment_id' => 'comments#update'  
		patch 'articles/:id/comments/:comment_id' => 'comments#update'

  resources :articles do
  	resources :comments
  end

end
