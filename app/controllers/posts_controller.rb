# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, :set_user_like, only: %i[show]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: I18n.t('simple_form.post.create.success') }
      else
        flash.now[:error] = I18n.t('simple_form.post.create.fail')
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.includes(:comments).find(params[:id])
    @post.comments.arrange
    @post
  end

  def set_user_like
    @user_like = user_signed_in? ? current_user.likes.find_by({ post_id: params[:id] }) : nil
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :category_id, :user_id)
  end
end
