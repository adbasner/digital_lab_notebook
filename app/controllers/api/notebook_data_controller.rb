class Api::NotebookDataController < ApplicationController
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
end
