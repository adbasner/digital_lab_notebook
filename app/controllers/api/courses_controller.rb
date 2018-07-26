class Api::CoursesController < ApplicationController
  def index
    @message = 'course'
    render 'index.json.jbuilder'
  end
end
