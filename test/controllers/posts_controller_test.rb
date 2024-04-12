# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:first)
    @post = posts(:first)
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    sign_in @user
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    sign_in @user
    post posts_url, params: { post: { body: @post.body, category_id: @post.category_id, user_id: @post.user_id, title: @post.title } }

    created_post = Post.find_by(
      body: @post.body,
      category_id: @post.category_id,
      title: @post.title,
      user_id: @user.id
    )

    assert(created_post)
    assert_redirected_to post_url(Post.last)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end
end
