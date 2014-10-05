class DirectionsController < ApplicationController
  def shortest_path
    @path = Metro_Graph.shortest_path(params[:orig], params[:dest])
  end

  def estimated_time
    @est_time = Metro_Graph.estimated_time(params[:orig], params[:dest])
  end
end