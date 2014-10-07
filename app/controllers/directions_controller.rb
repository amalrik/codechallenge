class DirectionsController < ApplicationController
  def some_path
    @path = Metro_Graph.some_path(params[:orig], params[:dest])
    render :json => { :error => 'not found' }, :status => 422 if @path == "not found"
  end

  def shortest_path
    @path = Metro_Graph.shortest_path(params[:orig], params[:dest])
  end

  def estimated_time
    @est_time = Metro_Graph.estimated_time(params[:orig], params[:dest])
  end
end