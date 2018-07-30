class Api::StudentsController < ApplicationController
  def index
    @students = Student.all
    render 'index.json.jbuilder'
  end

  def show
    @student = Student.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @student = Student.new(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      )

    # Add if statement eventually
    @student.save
    render 'show.json.jbuilder'
  end

  def update
    @student = Student.find_by(id: params[:id])
    @student.first_name = params[:first_name] || @student.first_name
    @student.last_name = params[:last_name] || @student.last_name
    @student.email = params[:email] || @student.email
    @student.password = params[:password] || @student.password
    @student.password_confirmation = params[:password_confirmation]

    # Add an if statement
    @student.save
  end

  def destroy
    @student = Student.find_by(id: params[:id])
    @student.destroy
    render json: { message: 'Student deleted' }
  end
end
