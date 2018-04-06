require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'
require 'pry'

class ReunionTest < Minitest::Test

    def setup
        @reunion = Reunion.new
    end

    def test_it_exists
        assert_instance_of Reunion, @reunion
    end

    def test_it_has_location
        reunion = Reunion.new("Yosemite")
        assert_equal "Yosemite", reunion.location
    end

    def test_it_has_activities
        hiking = Activity.new("hiking")
        camping = Activity.new("camping")
        bird_watching = Activity.new("bird watching")
        reunion_activities = {hiking: hiking, camping: camping, bird_watching: bird_watching}
        yosemite_reunion =  Reunion.new("Yosemite", activities)

        assert_equal true, !yosemite_reunion.activities.empty?
    end


end
