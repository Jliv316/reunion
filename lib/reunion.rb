require './lib/activity'
require 'pry'

class Reunion

    attr_reader :location
    attr_accessor :activities
    
    def initialize(location = "", activities = nil)
        @location = location
        @activities = activities
    end

end
