class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:edit, :update, :show, :destroy]

    def index
        @posts = Post.all
    end

    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
        redirect_to posts_path, notice: "Post created successfully."
        else
        render :new
        end
    end

      def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deleted."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
