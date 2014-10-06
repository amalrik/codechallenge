require 'spec_helper'

describe "Directions", :type => :request do
  describe "GET /directions/shortest_path" do
    it "returns the shortest path from some station to another" do
      get "/directions/shortest_path.json?orig=1&dest=5", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body).to match_array([
        {"id"=>"73"}, {"id"=>"182"}, {"id"=>"194"}, {"id"=>"5"}
      ])
    end

    it "returns 6min to get from station 1 to 5" do
      get "/directions/estimated_time.json?orig=1&dest=5", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body).to match({"estimated_time"=>"6 minutes"})
    end
  end
end