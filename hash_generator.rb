# will read in a .csv file of responses, and generate a hash of the keyword with the response that will occur upon activation.

require 'csv'

#file name must be a string
class HashGenerator

    attr_accessor :hash

    def initialize(file_name)
        @keys = CSV.read(file_name)
        matrix_to_hash
    end

    def matrix_to_hash
        @hash = Hash[@keys.map {|key, value| [key, value]}]
    end
end
