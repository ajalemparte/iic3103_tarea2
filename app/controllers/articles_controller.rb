class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]

	def index
		@articles = Article.order(created_at: :desc).limit(10)
		@articles.each do |article|
      if article.body.length >= 500
        if end_word = article.body[0..500].rindex(" ")
        	article.body = article.body[0..(end_word - 1)] + '...'
        else
        	article.body = article.body[0..497] + '...'
        end
      end 
    end
	end

	def admin
		@articles = Article.order(created_at: :desc)
	end

	def show
	end

	def new
		@article = Article.new
	end
		
	def create
		@article = Article.new(article_params)
		# @article.save
		# redirect_to @article	

		if @article.save
    	redirect_to articles_path
  	else
    	render 'new'
  	end
	end

	def destroy
    @article.destroy
    redirect_to admin_articles_path
  end

  def edit
	end

  def update
	  if @article.update(article_params)
	    redirect_to admin_articles_path
	  else
	    render 'edit'
	  end
  end

  private 
		def article_params
			params.require(:article).permit(:title, :subtitle, :body)
		end

		def set_article
	    @article = Article.find(params[:id])
	  end
end
