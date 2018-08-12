class Api::StudentTeacherPairsController < ApplicationController
  # def index
  #   @student_teacher_pairs = StudentTeacherPair.all
  #   render 'index.json.jbuilder'
  # end

  def show
    @student_teacher_pair = StudentTeacherPair.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @student_teacher_pair = StudentTeacherPair.new(
        teacher_id: params[:teacher_id],
        course_id: params[:course_id],
        student_id: current_student.id
      )

    # Add if statement eventually
    @student_teacher_pair.save
    render 'show.json.jbuilder'
  end

  # def update
  #   @student_teacher_pair = StudentTeacherPair.find_by(id: params[:id])
  #   @student_teacher_pair.teacher_id = params[:teacher_id] || @student_teacher_pair.teacher_id
  #   @student_teacher_pair.student_id = params[:student_id] || @student_teacher_pair.student_id
  #   @student_teacher_pair.course_id = params[:course_id] || @student_teacher_pair.course_id

  #   # Add an if statement
  #   @student_teacher_pair.save
  # end

  def destroy
    @student_teacher_pair = StudentTeacherPair.find_by(id: params[:id])
    @student_teacher_pair.destroy
    render json: { message: 'Classroom deleted' }
  end
end
