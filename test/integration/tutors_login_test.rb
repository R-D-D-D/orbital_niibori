require 'test_helper'

class TutorsLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = tutors(:michael)
  end

  test "login with valid information" do
    get tutor_login_path
    post tutor_login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'tutors/show'
    assert_select "a[href=?]", tutor_login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", tutor_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", tutor_login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", tutor_path(@user), count: 0
  end
end