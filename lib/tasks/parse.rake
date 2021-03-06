require "hpricot"
require "open-uri"

namespace :map do 

  MAPS_URL = "http://napalm.com.br/savage/maps"

  desc "List maps from map server"
  task :list do
    puts fetch_map_names!.inspect
  end

  desc "Fetch maps from map server and import into the database"
  task :import => :environment do
    map_names = fetch_map_names!
    for name in map_names
      Map.create! :name => name
    end
    puts "#{map_names.size} maps imported."
  end

  desc "Fetch map overhead images from server and store in application"
  task :overheads => :environment do
    for map in Map.all
      system "cd #{Rails.root}/public/map_overheads; curl #{MAPS_URL}/#{map.name}_overhead.jpg -O"
      puts "Imported map #{map.name}"
    end
  end

  desc "Create image thumbnails for map overheads"
  task :thumbs => :environment do
    for map in Map.all
      map.image = File.new("#{Rails.root}/public/map_overheads/#{map.name}_overhead.jpg")
      map.save!
      puts "Created thumb for map #{map.name}"
    end
  end
  
end

desc "Recreate image thumbnails (all sizes)"
task :images => :environment do
  for image in Image.all
    image.image = File.new(image.image.path)
    image.save!
    puts "Created thumbnails of image ##{image.id}"
  end
end

private

  def fetch_map_names!
    @doc = Hpricot(open(MAPS_URL))    
    maps = (@doc/"td a")
    maps.delete_if { |map| map.inner_html !~ /.jpg/ }
    maps_array = []
    for map in maps
      maps_array << map.inner_html[0..-14]
    end
    maps_array.shift # delete . (parent) directory
    maps_array
  end
  
