class Api::NotebookSectionsController < ApplicationController
  def index
    @notebook_sections = NotebookSection.all
    render 'index.json.jbuilder'
  end

  def show
    @notebook_section = NotebookSection.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @notebook_section = NotebookSection.new(
        lab_id: params[:lab_id],
        priority: params[:priority],
        heading: params[:heading],
        data: params[:data],
        student_can_edit: params[:student_can_edit]
      )

    # Add if statement eventually
    @notebook_section.save
    render 'show.json.jbuilder'
  end

  def update
    @notebook_section = NotebookSection.find_by(id: params[:id])
    @notebook_section.lab_id = params[:lab_id] || @notebook_section.lab_id
    @notebook_section.priority = params[:priority] || @notebook_section.priority
    @notebook_section.heading = params[:heading] || @notebook_section.heading
    @notebook_section.data = params[:data] || @notebook_section.data
    @notebook_section.student_can_edit = params[:student_can_edit] || @notebook_section.student_can_edit

    # Add an if statement
    @notebook_section.save
  end

  def destroy
    @notebook_section = NotebookSection.find_by(id: params[:id])
    @notebook_section.destroy
    render json: { message: 'Notebook section deleted' }
  end
end
