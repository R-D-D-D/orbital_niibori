class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = 'Successfully registered!'
      redirect_to @student
    else
      render 'new'
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end
end
