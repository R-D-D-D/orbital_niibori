class TutorsController < ApplicationController
  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      log_in_tutor @tutor
      flash[:success] = 'Successfully registered!'
      redirect_to @tutor
    else
      render 'new'
    end
  end

  def show
    @tutor = Tutor.find(params[:id])
  end

  def edit
  end

  def update

  end

  def destroy
  end

  def students
    @title = "Students under me"
    @courses = Tutor.find_by(params[:id]).courses
    @students = Array.new
    @courses.each do |course|
      course.students.uniq { |p| p.id}.each {|i| @students << i }
    end
    @students = @students.uniq { |p| p.id}
    render 'tutors/show_students'
  end

  private

  def tutor_params
    params.require(:tutor).permit(:name, :email, :password, :password_confirmation)
  end
end
