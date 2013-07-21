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

    def names
      units.map { |unit| unit.name }
    end

    private

    def set_max_amounts
      units.select { |unit| [:milliseconds, :seconds, :minutes].include? unit.name }.each do |unit|
        unit.max = max_for unit
      end
    end

    def max_for unit
      preceding = preceding_unit_for unit

      case unit.name
        when :milliseconds
          return 999     if preceding == :seconds || preceding.nil?
          return 59999   if preceding == :minutes
          return 3499999 if preceding == :hours
        when :seconds
          return 59   if preceding == :minutes || preceding.nil?
          return 3599 if preceding == :hours
        when :minutes
          return 59   if preceding == :hours || preceding.nil?
      end
    end

    def preceding_unit_for unit
      case unit.name
        when :milliseconds
          return :seconds if names.include? :seconds
          return :minutes if names.include? :minutes
          return :hours   if names.include? :hours
        when :seconds
          return :minutes if names.include? :minutes
          return :hours   if names.include? :hours
        when :minutes
          return :hours   if names.include? :hours
      end
    end

  end

end