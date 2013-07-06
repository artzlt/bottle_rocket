# encoding: UTF-8
# TODO: 'railsify' only here -> safe_buffer

module BottleRocket

  class Builder
    include TimeSpanner
    include Containers

    DEFAULT_DIRECTION  = :down
    DEFAULT_STEPS      = :seconds
    DEFAULT_UNITS      = [:days, :hours, :minutes, :seconds]
    DEFAULT_SEPARATORS = { millenniums: {value: 'MN'}, centuries: {value: 'C'}, decades: {value: 'D'}, years: {value: 'Y'}, months: {value: 'M'}, weeks: {value: 'w'}, days: {value: 'd'}, hours: {value: 'h'}, minutes: {value: 'm'}, seconds: {value: 's'}, milliseconds: {value: 'ms'}, microseconds: {value: 'µs'}, nanoseconds: {value: 'ns'} }

    attr_reader :direction, :steps, :units, :separators, :time_span

    def initialize(options)
      now  = Time.now
      from = options.delete(:from) || now
      to   = options.delete(:to)   || now

      @direction  = options.delete(:direction)  || DEFAULT_DIRECTION
      @steps      = options.delete(:steps)      || DEFAULT_STEPS
      @units      = options.delete(:units)      || DEFAULT_UNITS
      @separators = options.delete(:separators) || DEFAULT_SEPARATORS

      @time_span  = TimeSpan.new(from, to, units)
    end

    def html
      MainContainer.new(time_span, units, direction, steps, separators).to_html
    end

  end

end