class Activity
        attr_reader :type, :participants

    def initialize(type = nil)
        @type = type
        @participants = {} #name and the amount they paid for activity
    end

    def add_participants(name, money_paid)
        @participants[name] = money_paid
    end

    def total_cost(particpants)
        total = 0
      @participants.each_value do |value|
            total += value
        end
        return total
    end

    def split_cost(participants)
        total = total_cost(participants)
        cost_per_participant = (total / participants.length)
    end

    def assign_debt(participants)
        cost_per_participant = split_cost(participants)
        participants_debt = {}
        @participants.each_value do |value|
            debt = cost_per_participant - value
            participants_debt[@participants.key(value)] = debt
        end
        return participants_debt
    end
end