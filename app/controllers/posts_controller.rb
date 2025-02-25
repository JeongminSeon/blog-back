class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = current_user.posts.build(post_params) # 현재 로그인한 유저의 게시글 생성
    if @post.save
      render json = @post, status: :created
    else
      render json = @post.errors, status: :unprocessable_entity
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

    def destroy
      @post = current_user.posts.find(params[:id]) # 로그인한 유저의 게시글만 삭제 가능
      @post.destroy
      head :no_content
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content)
    end
  

end
