class PostsController < ApplicationController;
    before_action :authenticate_user! 
    
    def index
        @post = Post.all.paginate(page: params[:page], per_page: 4)
        render "index"
    end
    
    def destroy
        @post = Post.find(params[:id])
        authorize @post
        @post.destroy
        flash[:alert] = "Post Deleted succesfully."
        redirect_to user_root_path
    end
    
    def edit
        @post = Post.find(params[:id])
        authorize @post
        @post.update(title: params[:title],content:params[:description])
        
        if @post.valid?
            @post.save
            flash[:alert] = "Post updated succesfully."
            redirect_to user_root_path
        else
            flash[:alert] = "Validation error."
            redirect_to post_path
        end    
    end

    def create 
        @post = Post.new(post_params)
        @post.title = params[:title]
        @post.content = params[:description]
        @post.user_id=current_user.id
        
        if @post.valid?
            @post.save
            flash[:alert] = "Post Created succesfully."
            redirect_to user_root_path
        else
            flash[:alert] = "Validation error."
            redirect_to user_root_path
        end
    end
    
    def show
        @post = Post.find(params[:id])
        @title =  @post.title
        @content =  @post.content
        @id = params[:id]
        authorize @post
        render "update"
    end
    
    def search
        @query = params[:query]
        @post = Post.where("posts.title LIKE ?",["%#{@query}%"]).paginate(page: params[:page], per_page: 4)
        render "index"
    end

    def delete
        @post = Post.find(params[:id])
        @title =  @post.title
        @content =  @post.content
        @id = params[:id]
        render "confirmationPostdelete"
    end
    
    def showPost
        @post = Post.find(params[:id])
        page = params[:page]
        @title =  @post.title
        @content =  @post.content
        @id = params[:id]
        @userName = @post.user.email
        @comment = Comment.where(post_id: params[:id]).all.order("created_at DESC").paginate(page: params[:page], per_page: 4)
        
        if @comment.length == 0 and page != nil
            page = Integer(page)
            page = (page - 1) > 1 ? (page - 1) : 1 
            redirect_to showPost_path(page:page) 
        else
            render "showPost"
    end
end
    
    private
    def post_params
      params.permit(:title, :content)
    end
end
