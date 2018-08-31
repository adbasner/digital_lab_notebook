class Api::NotebookDataController < ApplicationController
  def index
    @notebook_data = NotebookDatum.all
    render 'index.json.jbuilder'
  end

  def show
    @notebook_datum = NotebookDatum.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @notebook_datum = NotebookDatum.new(
        student_id: current_student.id,
        notebook_section_id: params[:notebook_section_id],
        datum: params[:datum]
      )

    # Add if statement eventually
    # if current_teacher
      @notebook_datum.save!
    # end
    
    render 'show.json.jbuilder'
  end

  def destroy
  end
end
