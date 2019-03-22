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
      units.select { |unit| [:milliseconds, :seconds, :minutes, :hours].include? unit.name }.each do |unit|
        unit.max = max_for unit
      end
    end

    def max_for unit
      preceding = preceding_unit_for unit

      case unit.name
        when :milliseconds
          return 1000 - 1                if preceding == :seconds
          return 60 * 1000 - 1           if preceding == :minutes
          return 60 * 60 * 1000 - 1      if preceding == :hours
          return 24 * 60 * 60 * 1000 - 1 if preceding == :days
        when :seconds
          return 60 - 1                  if preceding == :minutes
          return 60 * 60 - 1             if preceding == :hours
          return 24 * 60 * 60 - 1        if preceding == :days
        when :minutes
          return 60 - 1                  if preceding == :hours
          return 24 * 60 - 1             if preceding == :days
        when :hours
          return 24 - 1                  if preceding == :days
      end
    end

    def preceding_unit_for unit
      case unit.name
        when :milliseconds
          return :seconds if names.include? :seconds
          return :minutes if names.include? :minutes
          return :hours   if names.include? :hours
          return :days    if names.include? :days
        when :seconds
          return :minutes if names.include? :minutes
          return :hours   if names.include? :hours
          return :days    if names.include? :days
        when :minutes
          return :hours   if names.include? :hours
          return :days    if names.include? :days
        when :hours
          return :days    if names.include? :days
      end
    end

  end

end
