class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @post.save
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to :posts
    else
      render "new", status: :unprocessable_entity
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memo))
      flash[:notice] = "ユーザーIDが「#{@post.id}」の情報を更新しました"
      redirect_to :posts
    else
      render "edit", status: :unprocessable_entity
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to posts_path
  end
end
