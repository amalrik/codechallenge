Metro_Graph = Graph.new
Line.all.each do |line|
  Metro_Graph.add_vertex(line.station1.to_s, {line.station2.to_s => 1})
  Metro_Graph.add_vertex(line.station2.to_s, {line.station1.to_s => 1})
end