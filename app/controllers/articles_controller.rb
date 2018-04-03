class ArticlesController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :set_article, only: [:edit, :update, :destroy]

	# GET ALL method
	def index
		@articles = Article.order(created_at: :desc)
		@articles.each do |article|
      if article.body.length >= 500
        if end_word = article.body[0..500].rindex(" ")
        	article.body = article.body[0..(end_word - 1)] + '...'
        else
        	article.body = article.body[0..497] + '...'
        end
      end 
    end
  render json: @articles
	end

	def admin
		@articles = Article.order(created_at: :desc)
	end

	# GET 1 method
	def show
  if @article = Article.findById(params[:id])
    render json: @article
  else
    response = {:error => "Noticia no encontrada"}
    render json: response, status: 404
  end
	end

	def new
		@article = Article.new
	end
		
	# PUT method
	def create
		@article = Article.create(article_params)
		if @article.save
    	render json: @article, status: 201
  	else
    	response = {:error => "Noticia no pudo ser creada"}
     render json: response, status: 500
  	end
	end

	# DELETE method
	def destroy
    if @article = Article.find_by_id(params[:id])
    		# response = @article
      @article.destroy
      render status: 204
    else
      response = {:error => "Noticia no encontrada"}
      render json: response, status: 404
    end
  end

  def edit
	end

	# PUT method
 def update
 	if @article = Article.find_by_id(params[:id])
    		if @article.update(article_params)
				    render json: @article
				  else
				    response = {:error => "Noticia no pudo ser actualizada"}
      		render json: response, status: 500
				  end
    else
      response = {:error => "Noticia no encontrada"}
      render json: response, status: 404
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
