Rails.application.routes.draw do

  get 'news' => 'articles#index'
  post 'news' => 'articles#create'
  get 'news/:id' => 'articles#show'
  delete 'news/:id' => 'articles#destroy'
		put 'news/:id' => 'articles#update'  
		patch 'news/:id' => 'articles#update'

		get 'news/:id/comments' => 'comments#index'
  post 'news/:id/comments' => 'comments#create'
  get 'news/:id/comments/:comment_id' => 'comments#show'
  delete 'news/:id/comments/:comment_id' => 'comments#destroy'
		put 'news/:id/comments/:comment_id' => 'comments#update'  
		patch 'news/:id/comments/:comment_id' => 'comments#update'

  resources :articles do
  	resources :comments
  end

end
