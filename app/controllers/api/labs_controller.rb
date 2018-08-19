class Api::LabsController < ApplicationController
  def index
    p '*************************'
    p params
    p '*************************'
    @labs = Lab.where(course_id: params[:course_id])
    render 'index.json.jbuilder'
  end

  def show
    @lab = Lab.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @lab = Lab.new(
        # classroom_id: params[:classroom_id],
        title: params[:title],
        complete: params[:complete]
      )

    # Add if statement eventually
    @lab.save
    render 'show.json.jbuilder'
  end

  def update
    @lab = Lab.find_by(id: params[:id])
    # @lab.classroom_id = params[:classroom_id] || @lab.classroom_id
    @lab.title = params[:title] || @lab.title
    @lab.complete = params[:complete] || @lab.complete

    # Add an if statement
    @lab.save
  end

  def destroy
    @lab = Lab.find_by(id: params[:id])
    @lab.destroy
    render json: { message: 'Lab deleted' }
  end
end
