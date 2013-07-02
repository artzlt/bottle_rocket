module TimeSpanner
  module TimeUnits

    class Millennium < CalendarUnit

      def initialize
        super 1
      end


      private

      def calculate_amount
        ( ( to.year - from.year ) / 1000 ) - ( true ? 0 : 1 )
      end

      def at_amount
        ( from.to_datetime >> amount * 12000 ).to_time
      end

      def rest_less_than_1_millennium?
        ( to.to_r - at_amount.to_r ) < 31556952000
      end

    end

  end
end
