require "GOT_wrapper/version"
require "unirest"

module GOTWrapper
  class House
  attr_reader :name, :region, :words
    def initialize(house)
      @name = house["name"]
      @region = house["region"]
      @words = house["words"]
    end

    def self.all
        houses_array = Unirest.get("http://www.anapioficeandfire.com/api/houses?").body
        houses = []
        houses_array.each do |house|
          houses << House.new(house)
        end
        houses
    end

    def self.find_by(house_name)
        key = house_name.keys.first
        value = house_name.values.first
        house = Unirest.get("http://www.anapioficeandfire.com/api/houses?#{key}=#{value}").body
        House.new(house)
    end




  end
end
