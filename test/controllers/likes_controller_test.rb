# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Rails >= 5

  setup do
    @user = users(:first)
    @post1 = posts(:first)
    @post2 = posts(:second)
    @like = post_likes(:first)
    sign_in @user
  end

  test 'should like post' do
    assert_difference('PostLike.count') do
      post post_likes_path(@post2)
    end

    assert_redirected_to post_url(@post2)
  end

  test 'should unlike post' do
    assert_difference('PostLike.count', -1) do
      delete post_like_path(@post1, @like)
    end

    assert_redirected_to post_url(@post1)
  end
end
