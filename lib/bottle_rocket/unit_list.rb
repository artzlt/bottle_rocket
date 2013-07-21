module BottleRocket

  class UnitList

    attr_reader :units

    def initialize units
      @units = units

      set_max_amounts
    end

    def map &block
      units.map do |unit|
        yield unit
      end
    end

    private

    def set_max_amounts
      units.each do |unit|
        unit.max = max_for unit
      end
    end

    def max_for unit
      59
    end

  end

end