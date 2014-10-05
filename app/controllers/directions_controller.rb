class DirectionsController < ApplicationController
  def simple_path
    @path = Metro_Graph.shortest_path(params[:orig], params[:dest])
  end
end