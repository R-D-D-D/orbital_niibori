require 'test_helper'

class StudentsSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get student_signup_path
    assert_no_difference 'Student.count' do
      post students_path, params: { student: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'students/new'
  end

  test "valid signup information" do
    get student_signup_path
    assert_difference 'Student.count', 1 do
      post student_signup_path, params: { student: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'students/show'
  end
end
