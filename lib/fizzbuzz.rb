


class Fizzbuzz

    attr_accessor :list

    def initialize 

        @list = (1..100).to_a
    end

    def printlist

        @list
    end

    def check_multiple3(number)
        if number%3==0
            return true
        else
            return false
        end
        
    end

    def check_multiple5(number)
        if number%5==0
            return true
        else
            return false
        end
    end


    def check_multiple13(number)
        #hace lo mismo que el if de los metodos anteriores
        number%13==0
    end

    def change_value 

        @list = @list.map do |number|

            if check_multiple3(number) && check_multiple5(number) 

                 'Fizzbuzz'

            elsif check_multiple3(number)

                  'Fizz'

            elsif check_multiple5(number)

                  'Buzz'

            elsif check_multiple13(number)

                  'meeek'

            else
                 number
            end
        end

        printlist
    end



    


end
