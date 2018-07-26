class Api::NotebookSectionsController < ApplicationController
  def index
    @message = 'notebook'
    render 'index.json.jbuilder'
  end
end
