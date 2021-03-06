require 'priority_queue'

class Graph
  SAME_STATION_MINS = 3 
  CHANGE_STATION_MINS = 12

  def initialize()
    @vertices = {}
  end

  def add_vertex(name, edges)
    if @vertices[name]
      @vertices[name].store(edges.keys.first, edges.values.first)
    else
      @vertices[name] = edges
    end
  end

  def some_path(start, finish)
    visited = []
    over    = false
    path    = []

    step  = Station.new(start.to_s, nil)
    queue = []
    queue << step

    while(!queue.empty? && !over)
      step = queue.shift
      if step.node == finish
        over = true
      else
        visited << step.node
        
        unvisited_neighbors(step.node, visited).each do |neighbor|
          queue.push Station.new(neighbor, step) 
        end
      end
    end
    
    if over
      while step.parent
        path.unshift step.node
        step = step.parent
      end
    else
      "not found"
    end
    path
  end

  def shortest_path(start, finish)
    maxint = (2**(0.size * 8 -2) -1)
    distances = {} # Distance from start to node
    previous = {} # Previous node in optimal path from source
    nodes = PriorityQueue.new # Priority queue of all nodes in Graph
    
    @vertices.each do | vertex, value |
      if vertex == start # Set root node as distance of 0
        distances[vertex] = 0
        nodes[vertex] = 0
      else
        distances[vertex] = maxint
        nodes[vertex] = maxint
      end
      previous[vertex] = nil
    end
    
    while nodes
      smallest = nodes.delete_min_return_key # Vertex in nodes with smallest distance in distances
      
      if smallest == finish # If the closest node is our target we're done so print the path
        path = []
        while previous[smallest] # Traverse through nodes til we reach the root which is 0
          path.push(smallest)
          smallest = previous[smallest]
        end
        return path
      end
      
      if distances[smallest] == maxint or smallest == nil # All remaining vertices are inaccessible from source
        break            
      end
      
      @vertices[smallest].each do | neighbor, value | # Look at all the nodes that this vertex is attached to
        alt = distances[smallest] + @vertices[smallest][neighbor] # Alternative path distance
        if alt < distances[neighbor] # If there is a new shortest path update our priority queue (relax)
          distances[neighbor] = alt
          previous[neighbor] = smallest
          nodes[neighbor] = alt
        end
      end
    end
    
    return distances
  end

  def estimated_time(start,finish)
    path = shortest_path(start, finish)
    index, @cost = 0, 0
    line_list = []
    loop do 
      line_list << find_line(path[index], path[index+1])
      break if index == path.size - 2
      index += 1
    end

    @cost = calculate_acumulated_cost(line_list)
  end

  def calculate_acumulated_cost(line_list)
    cost, index = 0, 0
    loop do
      cost += take_cost(line_list[index], line_list[index+1]) 
      break if index == line_list.size - 2
      index += 1
    end
    cost
  end

  def take_cost(cur_line, next_line)
    if cur_line == next_line
      SAME_STATION_MINS
    else
      CHANGE_STATION_MINS
    end
  end

  def find_line(current_st, next_st)
    Line.where("(station1 = ? AND station2 = ?) OR station1 = ? AND station2 = ?", current_st, next_st, next_st, current_st).first.line
  end

  def to_s
    return @vertices.inspect
  end

  private

  class Station < Struct.new(:node, :parent)
  end

  def unvisited_neighbors(node, visited)
    neighbors = []
    @vertices[node].keys.reverse.each do |key|
      neighbors << key unless visited.include?(key) 
    end
    neighbors
  end
end

#codigo roubado daki ;) https://github.com/mburst/dijkstras-algorithm/blob/master/dijkstras.rb 