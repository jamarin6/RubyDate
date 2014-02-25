require 'spec_helper'


describe Review do

	let(:movie) do
		Movie.new('Aladin','foo',Date.new(2012,1,1))
	end

	describe 'review' do
		it 'muestra un texto y una calificacion de cada movie' do
			review1 = Review.new('First review','Me gusta',5)
			review2 = Review.new('Second review','Buaaaah',1)
	

			movie.add_review(review1)
			movie.add_review(review2)

			reviews = movie.review
			puts reviews
			expect(reviews[0].description).to eq('Me gusta')
			expect(reviews[0].note).to eq(5)
			#expect(titles[0][1]).to eq('La peor pelicula del mundo')

			#expect(titles[1][0]).to eq(4)
			#expect(titles[1][1]).to eq(1)
		end

=begin
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
end