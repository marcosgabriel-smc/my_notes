class PostsController < ApplicationController

  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize_user
  skip_before_action :authenticate_user!, only: %i[show]

  # GET /posts
  def index
    @posts = policy_scope(Post).order(created_at: :desc).page(params[:page]).per(6)
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.date = Date.today

    if @post.new_category_name.present?
      category = Category.find_or_create_by(name: @post.new_category_name)
      @post.category = category
    end

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # PATCH/PUT /posts/1
  def update

    @post.date = Date.today
    if @post.new_category_name.present?
      category = Category.find_or_create_by(name: @post.new_category_name)
      @post.category = category
    end

    if @post.update(post_params)
      redirect_to post_url(@post), notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private

  def authorize_user
    post = @post || Post
    authorize post
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :content, :category_id, :new_category_name)
  end
end
