class Api::StudentsController < ApplicationController
  def index
    @message = 'students'
    render 'index.json.jbuilder'
  end
end

