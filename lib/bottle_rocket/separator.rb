# encoding: UTF-8

module BottleRocket

  class Separator

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

    attr_reader :title, :singular_title

    def initialize unit_name, options = {}
      @title          = options[:title] || DEFAULT_SEPARATORS[unit_name][:title]
      @singular_title = options[:singular] || @title
      @singularize    = options[:singularize]
    end

    def singularize?
      !!@singularize
    end

  end

end