require "hpricot"
require "open-uri"

MAPS_URL = "http://napalm.com.br/savage/maps/"

desc "List maps from map server"
task :maps do
  fetch_map_names!
end

desc "Fetch maps from map server and import into the database"
task :import_maps => :environment do
  map_names = fetch_map_names!
  for name in map_names
    Map.create! :name => name
  end
  puts "#{map_names.size} maps imported."
end

private

  def fetch_map_names!
    @doc = Hpricot(open(MAPS_URL))    
    maps = (@doc/"td a")
    maps.delete_if { |map| map.inner_html =~ /.jpg/ }
    maps_array = []
    for map in maps
      maps_array << map.inner_html[0..-5]
    end
    maps_array
  end
  
  
  
  # links = (@doc/".content-center-text-container")[0]/"a"
  # links[1].inner_html
  