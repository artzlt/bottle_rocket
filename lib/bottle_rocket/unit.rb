module BottleRocket

  class Unit

    attr_reader   :name, :amount, :separator
    attr_accessor :max

    def initialize name, amount, options = {}
      @name           = name
      @amount         = amount
      @separator      = setup_separator options[:separator]
      @leading_zeroes = options[:leading_zeroes]
    end

    def stringified_amount
      zerofy? ? zerofy_amount : amount.to_s
    end

    def singularize?
      [-1, 1].include? amount
    end


    private

    def setup_separator(separator_options)
      options = ( separator_options || {} ).merge( { singularize: singularize?} )
      Separator.new name, options
    end

    def zerofy?
      !!@leading_zeroes
    end

    def zerofy_amount
      if amount >= 0 && amount < 10
        "0#{amount}"
      elsif amount > -10
        "-0#{amount*-1}"
      end
    end

  end

end