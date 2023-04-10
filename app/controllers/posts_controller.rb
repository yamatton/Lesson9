class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id =current_user.id
    if @post.save
      flash[:notice] = '投稿完了しました'
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroyredorect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      render "edit"
    else
      redirect_to "/posts/#{@post.id}"
    end
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = '投稿更新完了しました。'
      redirect_to "/posts/#{@post.id}"
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:game_title, :evaluation, :title, :body)
  end
  
  def correct_user
    @post = Post.find(params[:id])
    @user = @book.user
    redirect_to(posts_path) unless @user == current_user
  end
end
