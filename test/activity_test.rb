require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require 'pry'

class ActivityTest < Minitest::Test

    def setup
        @activity = Activity.new
    end

    def test_it_exists
        assert_instance_of Activity, Activity.new
    end

    def test_it_can_add_participants
        @activity.add_participants("John", 10)
        assert_equal true, !@activity.participants.empty?
    end

    def test_it_has_correct_key_value_pairs
        @activity.add_participants("John", 10)
        assert_equal 10, @activity.participants["John"]
    end

    def test_it_can_evaluate_total_cost_of_activity
        @activity.add_participants("John", 10)
        @activity.add_participants("Shawn", 20)
        @activity.add_participants("Kim", 15)
        particpants = @activity.participants

        assert_equal 45, @activity.total_cost(particpants)
    end

    def test_it_can_split_cost_of_activity
        @activity.add_participants("John", 10)
        @activity.add_participants("Shawn", 12)
        @activity.add_participants("Kim", 11)
        participants = @activity.participants

        assert_equal 11, @activity.split_cost(participants)
    end

    def test_it_can_assign_debts
        @activity.add_participants("John", 10)
        @activity.add_participants("Shawn", 12)
        @activity.add_participants("Kim", 11)
        participants = @activity.participants
        actual_shawn = -1

        assert_equal 1, @activity.assign_debt(participants)["John"]
        assert_equal actual_shawn, @activity.assign_debt(participants)["Shawn"]
        assert_equal 0, @activity.assign_debt(participants)["Kim"]
    end
end
