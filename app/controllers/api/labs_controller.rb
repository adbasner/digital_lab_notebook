class Api::LabsController < ApplicationController
  def index
    @message = 'labs'
    render 'index.json.jbuilder'
  end
end
