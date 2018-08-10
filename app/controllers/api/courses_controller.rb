class Api::CoursesController < ApplicationController
  def index
    if current_teacher
      @courses = current_teacher.courses
      render 'index.json.jbuilder'
    elsif current_student
      @courses = current_student.courses
      # sql query here
      @not_enrolled = Course.all - current_student.courses
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
    if current_teacher
      p current_teacher.id
      @course = Course.new(
          name: params[:name],
          description: params[:description],
          teacher_id: current_teacher.id
        )

      # Add if statement
      @course.save
      render 'show.json.jbuilder'
    else
      render json: {message: "You can not do that"}
    end
  end

  def update
    if current_teacher
      @course = Course.find_by(id: params[:id])
      @course.name = params[:name] || @course.name
      @course.description = params[:description] || @course.description

      # Add an if statement
      @course.save
      render 'show.json.jbuilder'
    else
      render json: {message: "You can not do that"}
    end
  end

  def destroy
    if current_teacher
      @course = Course.find_by(id: params[:id])
      @course.destroy
      render json: { message: 'Course deleted' }
    else
      render json: {message: "You can not do that"}
    end
  end
end
