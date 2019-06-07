class TutorsController < ApplicationController
  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
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

  private

  def tutor_params
    params.require(:tutor).permit(:name, :email, :password, :password_confirmation)
  end
end
