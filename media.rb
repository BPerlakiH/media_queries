require 'json'

class Device

	attr_reader :name, :width, :height

	public
	def initialize(name, width, height)
		@name = name
		@width = width
		@height = height
	end

	public
	def fraction
		return Rational(width, height).to_s
	end

	public
	def rev_fraction
		return Rational(height, width).to_s
	end

	public
	def ratio
		return (width.to_f / height.to_f).to_s
	end

	public
	def rev_ratio
		return (height.to_f / width.to_f).to_s
	end

	public
	def to_portrait
		return {:name => name, :fraction => fraction, :ratio => ratio}
	end

	public
	def to_landscape
		return {:name => name, :fraction => rev_fraction, :ratio => rev_ratio}
	end

end

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

File.open("media.json", "w") { |file| file.write(sizes.to_json)}

system ("open -a Google\\ Chrome media.json")


