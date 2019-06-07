class SessionsController < ApplicationController
  def new_student
  end

  def new_tutor
  end

  def create_student
    @student = Student.find_by(email: params[:session][:email].downcase)
    if @student && @student.authenticate(params[:session][:password])
      log_in_student(@student)
      redirect_to @student
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new_student'
    end
  end

  def create_tutor

  end

  def destroy
    log_out
    redirect_to root_url
  end
end
