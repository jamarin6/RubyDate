require 'spec_helper'
require 'fizzbuzz'

describe Fizzbuzz do 

    
        context "when is a multiple of 3" do
            it "return true/false" do

                fizzbuzz = Fizzbuzz.new
                expect(fizzbuzz.check_multiple3(6)).to eq(true)
                expect(fizzbuzz.check_multiple3(7)).to eq(false)
            end


        end

        context "when is a multiple of 5" do
            it "return true/false" do

                fizzbuzz = Fizzbuzz.new
                expect(fizzbuzz.check_multiple5(10)).to eq(true)
                expect(fizzbuzz.check_multiple5(6)).to eq(false)
            end

            
        end

        context "when is a multiple of 13" do
            it "return true/false" do

                fizzbuzz = Fizzbuzz.new
                expect(fizzbuzz.check_multiple13(26)).to eq(true)
                expect(fizzbuzz.check_multiple13(7)).to eq(false)
            end

            
        end


    
    describe 'return a list of 100 values' do

        it 'return correct array' do

            fizzbuzz = Fizzbuzz.new
            expect(fizzbuzz.change_value[4]).to eq('Buzz')
            expect(fizzbuzz.change_value[2]).to eq('Fizz')
            expect(fizzbuzz.change_value[14]).to eq('Fizzbuzz')
            expect(fizzbuzz.change_value[12]).to eq('meeek')
            expect(fizzbuzz.change_value[6]).to eq(7)
        end
    end
        
end