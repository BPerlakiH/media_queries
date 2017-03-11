class Device

	attr_reader :name, :width, :height

	def initialize(name, width, height)
		@name = name
		@width = width
		@height = height
	end

	def fraction
		return Rational(width, height).to_s
	end

	def rev_fraction
		return Rational(height, width).to_s
	end

	def ratio
		return (width.to_f / height.to_f).to_s
	end

	def rev_ratio
		return (height.to_f / width.to_f).to_s
	end

	def to_portrait
		return {:name => name, :fraction => fraction, :ratio => ratio}
	end

	def to_landscape
		return {:name => name, :fraction => rev_fraction, :ratio => rev_ratio}
	end

end