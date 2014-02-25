require "date"
require 'review'


class Movie
	#attr_reader :title, :genre, :date, :comment, :note
	attr_reader :title, :genre, :date, :reviews;

	#def initialize(title, genre, date, comment = [], note = [])
	def initialize(title, genre, date)
	  @title = title
	  @genre = genre
	  @date = date
	  #@comment = comment
	  #@note = note
	  @reviews = []

	end

	def <=>(other_movie)      #le dice a sort como ordenar objeto 
	  	title <=>  other_movie.title   #(xq el sabe como ordenar strings) 
	end

	def review
		
		@reviews
		
	end


	def add_review(review)
		 
		 reviews << review
	end

=begin
	def review
		new_array = []
		new_array.push(@comment)
		new_array.push(@note)
		new_array
	end

	def add_review(comment, note)
		 @comment.push(comment)
		 @note.push(note)
	end

	def avg_value
		suma = @note.inject() {|total, number| total += number}
		suma / @note.length
	end
=end
end