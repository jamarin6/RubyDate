require 'spec_helper'
require 'movie'


describe Movie do
	describe 'attributes' do
		let(:movie) do
			Movie.new('Die Hard', 'Action', Date.new(1996, 1, 1))
		end
=begin
		def movie
			if defined?(@movie)
				@movie
			else
				@movie = Movie.new('Die Hard', 'Action', Date.new(1996, 1, 1))
			end
		end
=end
		it 'has a title' do
			#movie = Movie.new('Die Hard', 'Action', Date.new(1996, 1, 1))
			expect(movie.title).to eq('Die Hard')
		end

		it 'has a genre' do
			#movie = Movie.new('Die Hard', 'Action', Date.new(1996, 1, 1))
			expect(movie.genre).to eq('Action')
		end

		it 'has a date' do
			expect(movie.date).to eq(Date.new(1996, 1, 1))
		end
    end

    describe 'ordering' do
    	it 'orders  itself by its title' do
    		aladin = Movie.new('Aladin', 'Fantastic', Date.new(1992, 11, 18))
			clerks = Movie.new('Clerks', 'Musical', Date.new(1994, 11, 30))

			ordered_movies = [clerks, aladin].sort

			expect(ordered_movies.first).to eq(aladin)
			expect(ordered_movies.last).to eq(clerks)
		end
	end
=begin
	describe 'review' do
		it 'muestra un texto y una calificacion de cada movie' do
			aladin = Movie.new('Aladin', 'Fantastic',
			 Date.new(1992, 11, 18))

			aladin.add_review('Pelicula del mago aladin', 4)
			aladin.add_review('La peor pelicula del mundo', 1)

			titles = aladin.review
			puts titles
			expect(titles[0][0]).to eq('Pelicula del mago aladin')
			expect(titles[0][1]).to eq('La peor pelicula del mundo')

			expect(titles[1][0]).to eq(4)
			expect(titles[1][1]).to eq(1)
		end


		it 'avg_value' do
			aladin = Movie.new('Aladin', 'Fantastic',
			 Date.new(1992, 11, 18))

			aladin.add_review('Pelicula del mago aladin', 4)
			aladin.add_review('La peor pelicula del mundo', 2)

			titles = aladin.avg_value

			expect(titles).to eq(3)
		end		
	end
=end
end