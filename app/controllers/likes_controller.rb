# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_post, only: %i[create]
  # TODO: add before action with user login required
  def create
    @like1 = @post.likes.new({ user_id: current_user.id })

    respond_to do |format|
      if @like1.save
        format.html { redirect_to post_url(@post) }
      else
        format.html { redirect_to post_url(@post), notice: @like1.errors.full_messages }
      end
    end
  end

  def destroy
    @like1 = current_user.likes.find_by(id: params[:id])
    respond_to do |format|
      if @like1.nil?
        format.html { redirect_to post_url(params[:post_id]) } if @like1.nil?
      elsif @like1.destroy
        format.html { redirect_to post_url(params[:post_id]) }
      else
        format.html { redirect_to post_url(params[:post_id]), notice: @like1.errors.full_messages }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
