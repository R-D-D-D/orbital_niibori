class StudentsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :is_logged_out?, only: [:new, :create]

  def new
    @student = Student.new
    @tutor = Tutor.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      @student.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      @tutor = Tutor.new
      render 'new'
    end
  end

  def show
    @student = Student.find(params[:id])
    @courses = @student.newest_courses.paginate(page: params[:page])
    @title = student? && current_user?(@student) ?
      'My Profile' :
      "#{@student.name}'s Profile"
    if @student.activated?
      render 'courses/index'
    else
      redirect_to root_url and return
    end
  end

  def index
    @students = Student.where(activated: true).paginate(page: params[:page])
    @title = "All Students"
  end

  def courses
    @student = Student.find(params[:id])
    # Order courses by date of Subscription (newest Subscription first)
    @courses = @student.newest_courses.paginate(page: params[:page])
    @title = (student? && current_user?(@student)) ?
      "My Courses" :
      "#{@student.name}'s Courses"
    render 'courses/index'
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      flash[:success] = "Changes saved!"
      redirect_to edit_student_path(@student)
    else
      render 'edit'
    end
  end

  def destroy
    Student.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to students_url
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  # Confirms that the user is logged out
  def is_logged_out?
    if logged_in?
      flash[:danger] = "Please log out first."
      redirect_to root_path
    end
  end

end
