require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "location attributes must not be empty" do
    location = Location.new
    assert location.invalid?
    assert location.errors[:name].any?
  end

end
