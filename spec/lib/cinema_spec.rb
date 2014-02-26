require 'spec_helper'
require 'cinema'
require 'movie'



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

		#before do
		#	yelmo
		#end

		it 'returns an array with the title of our movies' do
			
			titles = cinema.listing

			expect(titles).to include('Die hard', 'Aladin', 'Clerks')
		end
	

		it 'returns the movies ordered by title' do
			titles = cinema.listing

			expect(titles).to eq(['Aladin', 'Clerks', 'Die hard'])
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

	describe 'group_by_genre' do
		it 'group the movies of the cinema by genre' do
			die_hard = Movie.new('Die hard', 'Action', Date.new(1988, 9, 30))
			aladin = Movie.new('Aladin', 'Fantastic', Date.new(1992, 11, 18))
			clerks = Movie.new('Clerks', 'Musical', Date.new(1994, 11, 30))
			matrix = Movie.new('Matrix', 'Fantastic', Date.new(1999, 6, 23))

			cinema = Cinema.new([die_hard, aladin, clerks, matrix])
			titles = cinema.group_by_genre

			expect(titles['Action']).to include('Die hard')
			expect(titles['Action'].length).to eq(1)

			expect(titles['Fantastic']).to include('Aladin', 'Matrix')
		end
	end

	describe 'movies_per_genre' do
		it 'counts the number of movies in each genre' do
			die_hard = Movie.new('Die hard', 'Action', Date.new(1988, 9, 30))
			aladin = Movie.new('Aladin', 'Fantastic', Date.new(1992, 11, 18))
			clerks = Movie.new('Clerks', 'Musical', Date.new(1994, 11, 30))
			matrix = Movie.new('Matrix', 'Fantastic', Date.new(1999, 6, 23))
			cinema = Cinema.new([die_hard, aladin, clerks, matrix])

			titles = cinema.movies_per_genre

			expect(titles['Action']).to eq(1)
			expect(titles['Musical']).to eq(1)
			expect(titles['Fantastic']).to eq(2)
		end
	end

	describe 'calendar' do
		it 'returns an array of movies within selected dates'
	
end


=begin

numbers.inject({}) do |hash, number|
hash[number] = number * 2
hash
end
--> {1 2 2 4 3 6 4 8 5 10 6 12 7 14 8 16 9 18]
=end
