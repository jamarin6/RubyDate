require 'spec_helper'
require 'user'
require 'movie'

describe User do
	describe 'it has the following attributes' do
		it 'has a nickname' do
			Kike = User.new("Paco")

			expect(Kike.nickname).to eq("Paco")
		end

		it 'has favorites' do
			Kike = User.new("Paco")
			expect(Kike.favorites).to eq([])
		end
	end

	describe 'it has the following methods' do
		it 'adds favorite movie' do
			Kike = User.new("Paco")
			Peli = Movie.new("Matrix", "fantastic", Date.new(2014,2,3))
			Kike.favorites << Peli
			expect(Kike.favorites).to eq([Peli])
		end

		it 'can delete favorite movies' do
			Kike = User.new("Paco")
			Peli = Movie.new("Matrix", "fantastic", Date.new(2014,2,3))
			Kike.favorites << Peli
			Kike.delete_favorite(Peli)
		    expect(Kike.favorites).to eq([])
		end
	end
end