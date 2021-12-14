require "test_helper"

class CategoryTest < ActiveSupport::TestCase


  def setup
    @category = Category.new(name: "news")
  end

  test "Name shold be presente" do
    assert @category.save
  end
  # test "the truth" do
  #   assert true
  # end
end
