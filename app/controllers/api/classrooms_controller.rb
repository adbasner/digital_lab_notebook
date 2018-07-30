class Api::ClassroomsController < ApplicationController
  def index
    @classrooms = Classroom.all
    render 'index.json.jbuilder'
  end

  def show
    @classroom = Classroom.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @classroom = Classroom.new(
        teacher_id: params[:teacher_id],
        student_id: params[:student_id],
        course_id: params[:course_id]
      )

    # Add if statement eventually
    @classroom.save
    render 'show.json.jbuilder'
  end

  def update
    @classroom = Classroom.find_by(id: params[:id])
    @classroom.teacher_id = params[:teacher_id] || @classroom.teacher_id
    @classroom.student_id = params[:student_id] || @classroom.student_id
    @classroom.course_id = params[:course_id] || @classroom.course_id

    # Add an if statement
    @classroom.save
  end

  def destroy
    @classroom = Classroom.find_by(id: params[:id])
    @classroom.destroy
    render json: { message: 'Classroom deleted' }
  end
end
