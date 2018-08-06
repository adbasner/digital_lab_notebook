class Api::CoursesController < ApplicationController
  def index
    if current_teacher
      @courses = current_teacher.courses
      render 'index.json.jbuilder'
    elsif current_student
      @courses = current_student.courses
      render 'index.json.jbuilder'
    else
      render json: []
    end
  end

  def show
    @course = Course.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @course = Course.new(
        name: params[:name]
      )

    # Add if statement eventually
    @course.save
    render 'show.json.jbuilder'
  end

  def update
    @course = Course.find_by(id: params[:id])
    @course.name = params[:name] || @course.name

    # Add an if statement
    @course.save
  end

  def destroy
    @course = Course.find_by(id: params[:id])
    @course.destroy
    render json: { message: 'Course deleted' }
  end
end
