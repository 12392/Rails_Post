class CommentsController < ApplicationController
    
    def index
        @comment = Comment.all
        render "posts/showPost"
    end
    
    
    def create 
        @comment = Comment.new(comment_params)
        @comment.post_id= params[:postId]
        @comment.comment = params[:comment] 
        @comment.email = params[:userName] 
            respond_to do |format|
                if @comment.valid? and @comment.save
                    format.js
                end
            end
    end

    
    def destroy
        @comment = Comment.find(params[:id])
        respond_to do |format|
            if @comment.destroy
             format.js
            end
        end
    end

    def edit
        @comment = Comment.find(params[:id])
        respond_to do |format|
            format.js
        end
    end

    def show
        @comment = Comment.find(params[:id])
        respond_to do |format|
                format.js
            end
    end

    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment: params[:comment])
        respond_to do |format|
            if @comment.valid? and @comment.save
                format.js
            end
        end
   end
    
    
    private
    def comment_params
      params.permit(:comment)
    end

end
