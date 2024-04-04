# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post, only: %i[create]

  def create
    @root_comment = @post.comments.new({ **comment_params, user_id: current_user.id })

    respond_to do |format|
      if @root_comment.save
        format.html { redirect_to post_url(@post), notice: I18n.t('comments.create.success') }
      else
        format.html { redirect_to post_url(@post), notice: @root_comment.errors.full_messages }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
