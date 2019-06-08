class SubscriptionsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    current_user.subscribe(@course)
    redirect_to @course
  end

  def destroy
    @course = Subscription.find(params[:id]).course
    current_user.unsubscribe(@course)
    redirect_to @course
  end
end
