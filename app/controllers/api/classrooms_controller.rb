class Api::ClassroomsController < ApplicationController
  def index
    @message = 'classrooms'
    render 'index.json.jbuilder'
  end
end
