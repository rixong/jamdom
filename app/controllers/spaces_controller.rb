class SpacesController < ApplicationController
  def new
  end

  def index
  end

  def show
    @space = Space.find(params[:id])
  end
end
