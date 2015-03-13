require 'test_helper'

class RegisteredUserTest < ActiveSupport::TestCase
	test "registered user attributes must not be empty" do
	registered_user = RegisteredUser.new
	assert registered_user.invalid?
	assert registered_user.errors[:first_name].any?
	assert registered_user.errors[:last_name].any?
	assert registered_user.errors[:username].any?
	assert registered_user.errors[:email].any?
	end
  # test "the truth" do
  #   assert true
  # end
end
