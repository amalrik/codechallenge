require 'csv'    

namespace :load_metro_data do
  desc "load csv files with metro stations information"
  task load_stations: :environment do
    file = "db/stations.csv"
    import_csv file
  end

  desc "load csv files with metro routes information"
  task load_routes: :environment do
    file = "db/metro_routes.csv"
    import_csv file
  end

  desc "load csv files with metro lines information"
  task load_lines: :environment do
    file = "db/lines.csv"
    import_csv file
  end

  def import_csv(file_name)
    model = parse_file_name(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, :headers => true)
    
    csv.each do |row|
      eval "#{model}.create!(row.to_hash)"
    end
  end

  def parse_file_name(file_name)
    model_name = strip_directory_extension file_name
    first,second = model_name.split("_")
    if second 
      "#{first.singularize.capitalize}#{second.singularize.capitalize}"
    else
      first.singularize.capitalize
    end
  end

  def strip_directory_extension(file_name)
    file_name.gsub(/.*\//,"").gsub(/\.csv/,"")
  end
end