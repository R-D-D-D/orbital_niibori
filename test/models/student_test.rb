require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def setup
    @user = Student.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (non-blank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "should subscribe and unsubscribe a course" do
    student = students(:michael)
    course  = courses(:piano)
    assert_not student.subscribing?(course)
    student.subscribe(course)
    assert student.subscribing?(course)
    student.unsubscribe(course)
    assert_not student.subscribing?(course)
  end
end
