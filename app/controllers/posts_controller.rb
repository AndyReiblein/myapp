class PostsController < ApplicationController
    def index
        @posts = Post.all
    end  
    
    def show 
    end 

    def new  
        @posts = Post.new
    end  

    def create 
        @post =Post.new(post_params)  

        if @post.save 
            redirect_to @post, notice: 'The post was created!'
        else 
            render 'new' 
        end 
    end 

    def edit 
    end 

    def update 
        if @post.update(post_params)
            redirect_to @post, notice: 'Update successful'
        else 
            render 'edit' 
        end 
    end 

    def destroy
        @post.destroy
        redirect_to root_path, notice: 'Post destroyed'
    end 

private 

    def post_params 
        params.require(:post).permit(:title, :content, :category_id)
    end 

    def find_post
        before_action :find_post, only: [:show, :edit, :update, :destroy]
        @post = Post.find(params[:id]) 
    end 
end
