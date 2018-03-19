class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]

	def index
		@articles = Article.order(created_at: :desc).limit(10)
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
    	redirect_to article_path(@article)
  	else
    	render 'new'
  	end
	end

	def destroy
    @article.destroy
    redirect_to article_path
  end

  def edit
	end

  def update
	  if @article.update(article_params)
	    redirect_to @article
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
