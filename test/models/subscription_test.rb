require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  def setup
    @subscription = Subscription.new(student_id: students(:michael).id,
                                     course_id: courses(:piano).id)
  end

  test "should be valid" do
    assert @subscription.valid?
  end

  test "should require a student_id" do
    @subscription.student_id = nil
    assert_not @subscription.valid?
  end

  test "should require a course_id" do
    @subscription.course_id = nil
    assert_not @subscription.valid?
  end
end
