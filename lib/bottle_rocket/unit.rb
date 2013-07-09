# encoding: UTF-8

module BottleRocket

  class Unit

    DEFAULT_SEPARATORS = {
      millenniums:  { title: 'MN' },
      centuries:    { title: 'C' },
      decades:      { title: 'D' },
      years:        { title: 'Y' },
      months:       { title: 'M' },
      weeks:        { title: 'w' },
      days:         { title: 'd' },
      hours:        { title: 'h' },
      minutes:      { title: 'm' },
      seconds:      { title: 's' },
      milliseconds: { title: 'ms' },
      microseconds: { title: 'µs' },
      nanoseconds:  { title: 'ns' }
    }

    attr_reader :name, :amount, :separator

    def initialize name, amount, options
      @name      = name
      @amount    = amount
      @separator = options[:separator] || DEFAULT_SEPARATORS[name]
    end

  end

end