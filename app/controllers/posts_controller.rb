class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @posts = Post.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @post = Post.new
  end
  
  def show
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Статья успешно создана'
    else
      render 'new', danger: 'Статья не была создана'
    end
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      redirect_to @post, success: 'Статья успешно обновлена!'
    else
      render 'edit', danger: 'Статья не была обновлена'
    end
  end
  
  def destroy
    if @post.destroy
      redirect_to root_path, success: 'Статья успешно удалена'
    end
  end
  
  
  private
  
  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags)
  end
  
  def find_post
    @post = Post.find(params[:id])
  end
end
