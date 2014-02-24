require 'rspec'
require_relative 'cinema'

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
end

describe Cinema do
	describe 'add' do
		it 'adds a movie to our listing' do
			cinema = Cinema.new

			cinema.add(Movie.new('Clerks', 'Musical', Date.new))

			expect(cinema.listing).to include('Clerks')
		end
	end

	describe 'listing' do
		let(:cinema) do
			die_hard = Movie.new('Die hard', 'Action', Date.new(1988, 9, 30))
			aladin = Movie.new('Aladin', 'Fantastic', Date.new(1992, 11, 18))
			clerks = Movie.new('Clerks', 'Musical', Date.new(1994, 11, 30))
			Cinema.new([die_hard, aladin, clerks])
		end
		it 'returns an array with the title of our movies' do
			
			titles = cinema.listing

			expect(titles).to include('Die hard')
			expect(titles).to include('Aladin')
			expect(titles).to include('Clerks')
		end
	

		it 'returns the movies ordered by title' do
			titles = cinema.listing

			expect(titles[0]).to eq('Aladin')
			expect(titles[1]).to eq('Clerks')
			expect(titles[2]).to eq('Die hard')
		end
	end

	describe 'remove' do
		it 'removes a movie from our listing' do
			die_hard = Movie.new('Die hard', 'Action', Date.new(1988, 9, 30))
			aladin = Movie.new('Aladin', 'Fantastic', Date.new(1992, 11, 18))
			cinema = Cinema.new([die_hard, aladin])

			cinema.remove(die_hard)

			expect(cinema.listing).to_not include('Die hard')
		end
	end

	describe 'listing_by_genre' do
		it 'returns the movies of that genre' do
			die_hard = Movie.new('Die hard', 'Action', Date.new(1988, 9, 30))
			aladin = Movie.new('Aladin', 'Fantastic', Date.new(1992, 11, 18))
			clerks = Movie.new('Clerks', 'Musical', Date.new(1994, 11, 30))
			matrix = Movie.new('Matrix', 'Fantastic', Date.new(1999, 6, 23))
			air_plane = Movie.new('Air Plane', 'Action', Date.new(1980, 12, 18))

			cinema = Cinema.new([die_hard, aladin, clerks, matrix, air_plane])
			titles = cinema.listing_by_genre('Action')

			expect(titles).to eq(['Air Plane', 'Die hard'])
		end
	end

	describe 'list_by_date' do
		it 'returns the movies ordered by date' do
			clerks = Movie.new('Clerks', 'Musical', Date.new(1994, 11, 30))
			matrix = Movie.new('Matrix', 'Fantastic', Date.new(1999, 6, 23))
			air_plane = Movie.new('Air Plane', 'Action', Date.new(1980, 12, 18))

			cinema = Cinema.new([clerks, matrix, air_plane])
			titles = cinema.list_by_date

			expect(titles).to eq(['Air Plane', 'Clerks', 'Matrix'])

		end
	end

	describe 'listing_by_time_frame' do
		it 'returns the movies in a time frame' do
			die_hard = Movie.new('Die hard', 'Action', Date.new(1988, 9, 30))
			aladin = Movie.new('Aladin', 'Fantastic', Date.new(1992, 11, 18))
			clerks = Movie.new('Clerks', 'Musical', Date.new(1994, 11, 30))
			matrix = Movie.new('Matrix', 'Fantastic', Date.new(1999, 6, 23))
			air_plane = Movie.new('Air Plane', 'Action', Date.new(1980, 12, 18))

			cinema = Cinema.new([die_hard, aladin, clerks, matrix, air_plane])
			titles = cinema.list_by_time_frame(Date.new(1988, 9, 30), Date.new(1994, 11, 30))

			expect(titles).to_not include('Air Plane', 'Matrix')
			expect(titles).to include('Aladin', 'Clerks', 'Die hard')
		end
	end

end
