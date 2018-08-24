class Api::LabsController < ApplicationController
  def index
    @labs = Lab.where(course_id: params[:course_id])
    if current_teacher
      @role = 'teacher'
    elsif current_student
      @role = 'student'
    else
      @role = 'Not logged in.'
    end
    render 'index.json.jbuilder'
  end

  def show
    @lab = Lab.find_by(id: params[:id])
    if current_teacher
      @role = 'teacher'
    elsif current_student
      @role = 'student'
    else
      @role = 'Not logged in.'
    end
    render 'show.json.jbuilder'
  end

  def create
    @lab = Lab.new(
        course_id: params[:course_id],
        title: params[:title],
        complete: false
      )

    # Add if statement eventually
    if current_teacher
      @lab.save
    end
    render 'show.json.jbuilder'
  end

  def update
    @lab = Lab.find_by(id: params[:id])
    # @lab.classroom_id = params[:classroom_id] || @lab.classroom_id
    @lab.title = params[:title] || @lab.title
    @lab.complete = params[:complete] || @lab.complete

    # Add an if statement
    if current_teacher
      @lab.save
    end
    render 'show.json.jbuilder'
  end

  def destroy
    @lab = Lab.find_by(id: params[:id])
    if current_teacher
      @lab.destroy
    end
    
    render json: { message: 'Lab deleted' }
  end
end
