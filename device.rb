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