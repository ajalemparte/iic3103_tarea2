class CommentsController < ApplicationController
	skip_before_action :verify_authenticity_token

	
	# GET ALL method
	def index
		if @article = Article.find_by_id(params[:id])
	  	@comments = @article.comments.order(created_at: :desc).select(:id, :author, :comment)
	  	# @comments = @article.comments.order(created_at: :desc)
	  	render json: @comments
	  else
	    response = {:error => "not found"}
	    render json: response, status: 404
	  end
	end

	# GET 1 method
	def show
		if @article = Article.find_by_id(params[:id])
			if @comment = @article.comments.where(id: params[:comment_id]).select(:id, :author, :comment)
	    	render json: @comment
		  else
		    response = {:error => "not found"}
		    render json: response, status: 404
		  end
	  else
	    response = {:error => "not found"}
	    render json: response, status: 404
	  end
	end

	# PUT method
	def create
		if @article = Article.find_by_id(params[:id])
   		@comment = @article.comments.create(comment_params)
			if @comment.save
	    	render json: @comment, status: 201
	  	else
	    	response = {:error => "Comentario no pudo ser creado"}
	  	  render json: response, status: 500
	  	end
	  else
	    response = {:error => "not found"}
	    render json: response, status: 404
	  end
 	end
 
 	# DELETE method
	def destroy
		if @article = Article.find_by_id(params[:id])
   		if @comment = @article.comments.where(id: params[:comment_id])
	  		# response = @article
		    @comment.destroy
		    render status: 204
		  else
		    response = {:error => "not found"}
		    render json: response, status: 404
		  end
	  else
	    response = {:error => "not found"}
	    render json: response, status: 404
	  end
	end

	# PUT method
	def update
		if @article = Article.find_by_id(params[:id])
   		if @comment = @article.comments.where(id: params[:comment_id])
	  		if @comment.update(article_params)
				    render json: @comment
			  else
			    response = {:error => "Comentario no pudo ser actualizadp"}
    			render json: response, status: 500
			  end
		  else
		    response = {:error => "not found"}
		    render json: response, status: 404
		  end
	  else
	    response = {:error => "not found"}
	    render json: response, status: 404
	  end 
 end

  private
    def comment_params
      params.permit(:author, :comment)
    end
end
