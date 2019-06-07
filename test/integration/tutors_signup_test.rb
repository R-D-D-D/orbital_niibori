require 'test_helper'

class TutorsSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information tutor" do
    get tutor_signup_path
    assert_no_difference 'Tutor.count' do
      post tutor_signup_path, params: { tutor: { name:  "",
                                               email: "user@invalid",
                                               password:              "foo",
                                               password_confirmation: "bar" } }
    end
    assert_template 'tutors/new'
  end

  test "valid signup information tutor" do
    get tutor_signup_path
    assert_difference 'Tutor.count', 1 do
      post tutor_signup_path, params: { tutor: { name:  "Example User",
                                                     email: "user@example.com",
                                                     password:              "password",
                                                     password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'tutors/show'
    assert is_logged_in?
  end
end
