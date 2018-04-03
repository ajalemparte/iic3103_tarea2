class ArticlesController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :set_article, only: [:edit, :update]
	before_action :set_header

	# GET ALL method
	def index
		@articles = Article.order(created_at: :desc)
		@articles.each do |article|
			article.truncate(500)
    end
  render json: @articles
	end

	def admin
		@articles = Article.order(created_at: :desc)
	end

	# GET 1 method
	def show
		begin
			@article = Article.find(params[:id])
			render json: @article
		rescue ActiveRecord::RecordNotFound  
			response = {:error => "Not found"}
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
			response.headers["Location"] = "/news/#{@article[:id]}" 
    	render json: @article, status: 201
  	else
    	response = {:error => "Noticia no pudo ser creada"}
     render json: response, status: 500
  	end
	end

	# DELETE method
	def destroy
    if @article = Article.find_by_id(params[:id])
      @article.destroy
      render json: @article, status: 200
    else
      response = {:error => "Not found"}
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
      response = {:error => "Not found"}
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

	 def set_header
    response.headers["Content-Type"] = "application/json"
  end
end
