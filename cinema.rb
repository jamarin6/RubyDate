require "date"

class Movie
	attr_reader :title, :genre, :date

	def initialize(title, genre, date)
	  @title = title
	  @genre = genre
	  @date = date
	end

	def <=>(other_movie)      #le dice a sort como ordenar objeto 
	  	title <=>  other_movie.title   #(xq el sabe como ordenar strings) 
	end

end

class Cinema
	def initialize(movies = [])
		@movies = movies
	end

	def listing
		@movies.map{|movie| movie.title}.sort
		
	end

	def listing_by_genre(genre)
		movies_by_genre = @movies.select do |movie|
			movie.genre == genre
		end
		movies_by_genre.sort.map{|movie| movie.title}
	end

	def list_by_date
		@movies.sort_by(&:date).map(&:title)
		#@movies.sort_by{|movie| movie.date}.map{|movie| movie.title}
	end

	def list_by_time_frame(date1, date2)
		movies_by_time = @movies.select do |movie|
			date1 <= movie.date && movie.date <= date2
		end
		movies_by_time.sort.map{|movie| movie.title}
	end

	def group_by_genre
		@movies.inject({}) do |hash, movie|
			hash[movie.genre] ||= [] #necesita inicializarse a array xq sino es nill, y nill.push (q es = q <<) no existe
			hash[movie.genre] << movie.title  #pero array.push (osea <<) si existe y lo reconoce
			hash
		end
	end

	def movies_per_genre
		@movies.inject({}) do |my_hash, movie|
			my_hash[movie.genre] ||= 0
			my_hash[movie.genre] += 1
			my_hash
		end
	end
=begin

	def group_by_genre     #otra manera del metodo group_by_genre
		if movies_by_genre[movie.genre] = nill
			movies_by_genre[movie.genre] = []
			movies_by_genre[movie.genre].push(movie.title)
		else
			movies_by_genre[movie.genre].push(movie.title)
		end
		movies_by_genre
	end

	def group_by_genre      #otra forma para ver mejor el group_by_genre
		@movies.inject({}) do |movies_by_genre, movie|
			movies_by_genre[movie.genre] ||= [] #necesita inicializarse a array xq sino es nill, y nill.push (q es = q <<) no existe
			movies_by_genre[movie.genre] << movie.title  #pero array.push (osea <<) si existe y lo reconoce
			movies_by_genre
		end
	end



	def listing
		@movies.sort_by{|movie| movie.title}.map{|movie| movie.title} otra manera d hacerlo
	o tambien... @movies.sort_by{&:title}.map{|movie| movie.title}

	def listing
		@movies.map {|movie| movie.title} #map crea array d string con los nombres
	end
	def listing
		@movies.each {|movie| puts movie.title}
		
		puts ""
	end
=end

	def add(movie)
		@movies << movie
	#@movies.push(movie)  es otra forma de hacerlo
	end

	def remove(movie)
		@movies.delete(movie)	
	end



=begin
	  def revome(movie_to_remove)
		@movies.delete_if do |movie| 
		movie.title == movie_to_remove.title
		end
	  end

	  def <=>(other_movie)      xa ordenar, esto devuelve -1, 0 o 1 si < = > respectivamente
	  	title <=>  other_movie.title
	  end
=end
end

die_hard = Movie.new('Die hard', 'Action', Date.new(1988, 9, 30))
aladin = Movie.new('Aladin', 'Fantastic', Date.new(1992, 11, 18))
clerks = Movie.new('Clerks', 'Musical', Date.new(1994, 11, 30))
matrix = Movie.new('Matrix', 'Fantastic', Date.new(1999, 6, 23))
air_plane = Movie.new('Air Plane', 'Action', Date.new(1980, 12, 18))

cinema = Cinema.new([die_hard, aladin, clerks])
cinema.add(matrix)
cinema.add(air_plane)
#puts cinema.listing 
#puts cinema.listing_by_genre('Action')
#puts cinema.list_by_date
puts cinema.list_by_time_frame(Date.new(1988, 9, 30), Date.new(1994, 11, 30))

