# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_post, only: %i[create]
  # TODO: add before action with user login required
  def create
    @like = @post.likes.new({ user_id: current_user.id })

    respond_to do |format|
      if @like.save
        format.html { redirect_to post_url(@post) }
      else
        format.html { redirect_to post_url(@post), notice: @like.errors.full_messages }
      end
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    respond_to do |format|
      if @like.destroy
        format.html { redirect_to post_url(params[:post_id]) }
      else
        format.html { redirect_to post_url(params[:post_id]), notice: @like.errors.full_messages }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end