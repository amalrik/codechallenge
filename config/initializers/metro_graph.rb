Rails.application.config.before_initialize do
  Metro_Graph = Graph.new
  if ActiveRecord::Base.connection.table_exists? 'kittens'
    Line.all.each do |line|
      Metro_Graph.add_vertex(line.station1.to_s, {line.station2.to_s => 1})
      Metro_Graph.add_vertex(line.station2.to_s, {line.station1.to_s => 1})
    end
  end
end