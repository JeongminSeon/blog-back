class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
    render json: @posts
  end
  
    def new
      @post = Post.new
      render json: @post  # ✅ 추가: new 액션이 있어야 테스트가 통과됨.
    end

  def show
    @post = Post.find_by(id: params[:id])
    if @post
      render json: @post
    else
      render json: { error: "게시글을 찾을 수 없습니다." }, status: :not_found
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])
    if @post.nil?
      render json: { error: "게시글을 찾을 수 없습니다.", post_id: params[:id], current_user_id: current_user.id }, status: :not_found
      return
    end
  
    if @post.update(post_params)
      render json: @post
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    if @post
      @post.destroy
      head :no_content
    else
      render json: { error: "게시글을 찾을 수 없습니다." }, status: :not_found
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
