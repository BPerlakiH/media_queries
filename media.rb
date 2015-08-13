require 'json'
require './device'


devices = [
	Device.new("iphone4", 		320, 	480),
	Device.new("iphone5", 		320, 	568),
	Device.new("iphone6", 		375, 	667),
	Device.new("iphone6-plus", 	414, 	736),
	Device.new("ipad", 			768, 	1024),
]


sizes = {}

landscapes = []
devices.sort_by { |d| d.rev_ratio}.reverse!.each do |d|
	landscapes.push(d.to_landscape)
end
sizes[:landscape] = landscapes

portraits = []
devices.sort_by { |d| d.ratio }.reverse!.each do |d| 
	portraits.push(d.to_portrait)
end

sizes[:portrait] = portraits

puts sizes.to_json

#update the json file
File.open("media.json", "w") { |file| file.write(sizes.to_json)}

# system ("open -a Google\\ Chrome media.json")


