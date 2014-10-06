require 'spec_helper'

describe "Directions", :type => :request do
  describe "GET /directions/shortest_path" do
    it "returns the shortest path from some station to another" do
      get "/directions/shortest_path.json?orig=1&dest=5", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      
      #movie_titles = body.map { |m| m["title"] }

      #expect(movie_titles).to match_array(["The Lord of the Rings",
      #                                     "The Two Towers"])
    end
  end
end