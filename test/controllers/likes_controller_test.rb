# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Rails >= 5

  setup do
    @user = users(:first)
    @post1 = posts(:first)
    @post2 = posts(:second)
    @like1 = post_likes(:first)
    @like2 = post_likes(:second)
    sign_in @user
  end

  test 'create' do
    assert_difference('PostLike.count') do
      post post_likes_path(@post2)
    end

    assert_redirected_to post_url(@post2)
  end

  test 'destroy' do
    assert_difference('PostLike.count', -1) do
      delete post_like_path(@post1, @like1)
    end

    assert_redirected_to post_url(@post1)
  end

  test 'destroy by other user' do
    assert_no_difference('PostLike.count') do
      delete post_like_path(@post2, @like2)
    end

    assert_redirected_to post_url(@post2)
  end
end
