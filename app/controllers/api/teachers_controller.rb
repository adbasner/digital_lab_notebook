class Api::TeachersController < ApplicationController
  def create
    @teacher = Teacher.new(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      )

    # If statement
    if @teacher.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @teacher.errors.full_messages}, status: unprocessable_entity
    end
  end

  def update
    @teacher = Teacher.find_by(id: params[:id])
    @teacher.first_name = params[:first_name] || @teacher.first_name
    @teacher.last_name = params[:last_name] || @teacher.last_name
    @teacher.email = params[:email] || @teacher.email
    @teacher.password = params[:password] || @teacher.password
    @teacher.password_confirmation = params[:password_confirmation]

    # Add an if statement
    @teacher.save
  end

  def destroy
    @teacher = Teacher.find_by(id: params[:id])
    @teacher.destroy
    render json: { message: 'Teacher deleted' }
  end
end
