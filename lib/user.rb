class User
	attr_reader :nickname, :favorites
	def initialize (nickname)
		@nickname = nickname
		@favorites = []
	end

	def delete_favorite (peli)
		favorites.delete(peli)
	end
end

