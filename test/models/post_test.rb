require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'validなpost' do
    post = Post.new(title: 'title')

    assert post.valid?
    assert_difference("Post.count", 1) do
      post.save
    end
  end

  test 'title は必須' do
    post = Post.new(title: '')

    assert post.invalid?
    assert post.errors.details[:title].present?
  end
end
