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

    attr_reader :name, :separator

    def initialize name, amount, options = {}
      @name           = name
      @amount         = amount
      @separator      = options[:separator] || DEFAULT_SEPARATORS[name]
      @leading_zeroes = options[:leading_zeroes]
    end

    def amount
      zerofy? ? zerofied_amount : @amount.to_s
    end

    def zerofy?
      @leading_zeroes
    end

    def zerofied_amount
      if @amount >= 0 && @amount < 10
        "0#{@amount}"
      elsif @amount > -10
        "-0#{@amount*-1}"
      end
    end

  end

end