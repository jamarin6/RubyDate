class Review

	attr_reader :title
	attr_accessor :description,:note

	def initialize(title, description, note)
		@title = title
		@description = description
		@note = note
		
	end

	

end