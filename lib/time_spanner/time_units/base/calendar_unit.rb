module TimeSpanner
  module TimeUnits

    class CalendarUnit < Unit

      attr_reader :from, :to

      def initialize position
        super position
      end

      def calculate duration, to
        @to       = to
        @from     = @to - duration.to_r
        @amount   = calculate_amount

        calculate_rest at_amount
      end


      private

      def calculate_rest from
        @rest = to.to_r - from.to_r
      end

    end
  end

end
