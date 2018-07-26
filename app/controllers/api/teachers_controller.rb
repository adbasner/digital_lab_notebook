class Api::TeachersController < ApplicationController
  def index
    @message = 'teachers'
    render 'index.json.jbuilder'
  end
end
