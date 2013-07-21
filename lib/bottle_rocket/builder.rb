# encoding: UTF-8

module BottleRocket

  class Builder
    include TimeSpanner
    include Containers

    DEFAULT_DIRECTION  = :down
    DEFAULT_STEPS      = :seconds
    DEFAULT_UNITS      = [ :days, :hours, :minutes, :seconds ]

    attr_reader :direction, :steps, :units, :unit_list, :from, :to

    def initialize options
      now   = Time.now
      @from = options[:from] || now
      @to   = options[:to]   || now

      @direction = options[:direction] || DEFAULT_DIRECTION
      @steps     = options[:steps] || DEFAULT_STEPS
      @units     = setup_units( options[:units] || [] )
      @unit_list = UnitList.new units
    end

    # TODO: MainContainer.new doesn't feel good (Formatter?)
    def html
      safe_buffer MainContainer.new( unit_list, direction, steps ).to_html
    end

    private

    def safe_buffer string
      defined?( Rails ) ? ActiveSupport::SafeBuffer.new( string ) : string
    end

    # TODO: refactor
    def setup_units units_options
      units_options = units_options.map do |unit|
        unit.is_a?( Hash ) ? unit : { unit => {} }
      end

      unit_names = units_options.empty? ? DEFAULT_UNITS : units_options.map { |opt| opt.keys.first }
      time_span  = TimeSpan.new from, to, unit_names

      if units_options.any?
        units_options.map do |unit_option|
          name = unit_option.keys.first
          Unit.new name, time_span[name], unit_option[name]
        end
      else
        DEFAULT_UNITS.map { |unit_name| Unit.new unit_name, time_span[unit_name], {}}
      end
    end

  end

end