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
    # @notebook_sections = @lab.notebook_sections
    @notebook_sections = []
    @nbs = @lab.notebook_sections
    # @nbs.each do |nbs|
    #   nbs_hash = {
    #     id: nbs.id,
    #     lab_id: nbs.lab_id,
    #     priority: nbs.priority,
    #     heading: nbs.heading,
    #     datum: nbs.datum,
    #     student_can_edit: nbs.student_can_edit
    #   }
    #   student_id = ""
    #   nbdata = []
    #   nbs.notebook_data.each do |nbd| 
    #     student_id = nbd.student_id
    #     p student_id
    #     nbdata << nbd.datum
    #   end
    #   nbs_hash[:notebook_data] = nbdata
    #   p nbs_hash
    #   @notebook_sections << nbs_hash
    # end

    if current_teacher
      @nbs.each do |nbs|
        nbs_hash = {
          id: nbs.id,
          lab_id: nbs.lab_id,
          priority: nbs.priority,
          heading: nbs.heading,
          datum: nbs.datum,
          student_can_edit: nbs.student_can_edit
        }

        nbdata = []
        nbs.notebook_data.each do |nbd| 
          nbdata << nbd.datum
        end
        nbs_hash[:notebook_data] = nbdata
        p nbs_hash
        @notebook_sections << nbs_hash
      end
      @role = 'teacher'
    elsif current_student
      @nbs.each do |nbs|
        nbs_hash = {
          id: nbs.id,
          lab_id: nbs.lab_id,
          priority: nbs.priority,
          heading: nbs.heading,
          datum: nbs.datum,
          student_can_edit: nbs.student_can_edit
        }

        nbdata = []

        note_book_data = NotebookDatum.where(student_id: current_student.id, notebook_section_id: nbs.id)

        note_book_data.each do |nbd|
          nbdata << nbd.datum
        end

        nbs_hash[:notebook_data] = nbdata

        @notebook_sections << nbs_hash
      end

      @role = 'student'
      # here!
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
