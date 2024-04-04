# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Rails >= 5

  setup do
    sign_in users(:first)
    @post = posts(:first)
    @root_comment = post_comments(:root_comment1)
    @nested_comment = post_comments(:nested_comment1)
  end

  test 'should create comment' do
    assert_difference('PostComment.count') do
      post post_comments_path(@post), params: { post_comment: { content: @root_comment.content } }
    end

    assert_redirected_to post_url(@post)
  end

  test 'should create nested comment' do
    assert_difference('PostComment.count') do
      post post_comments_path(@post), params: { post_comment: { content: @nested_comment.content, parent_id: ActiveRecord::FixtureSet.identify(:root_comment1) } }
    end

    assert_redirected_to post_url(@post)
  end
end
