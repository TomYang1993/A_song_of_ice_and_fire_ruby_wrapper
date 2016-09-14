require "GOT_wrapper/version"
require "unirest"
require "pry"

module GOTWrapper
  class House
  attr_reader :name, :region, :words
    def initialize(house)
      @name = house["name"]
      @region = house["region"]
      @words = house["words"]
    end

    def self.all
      house_array = []
      i = 1
      while i < 41
        house_array << Unirest.get("http://www.anapioficeandfire.com/api/houses?page="+ i.to_s).body
        i += 1
      end
      houses = []
      house_array.each do |tenhouse|
        tenhouse.each do |house|
          houses << House.new(house)
        end
      end
      houses
    end

    def self.find_by(house_name)
      items = self.all
      items.select{ |item| item.name.include? house_name }
    end




  end
end
