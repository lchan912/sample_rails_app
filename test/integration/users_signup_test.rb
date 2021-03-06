require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test 'invalid signup information' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {
        name: "",
        email: 'user@email.com',
        password: "foo",
        password_confirmation: "foo"
      }
    end
    assert_template 'users/new'
  end

  test 'valid signup information' do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {name: "Example User", email: "user2@email.com", password:"123456", password_confirmation:"123456"}
    end
    assert_template 'users/show'
    assert is_logged_in?
  end

end
