module BottleRocket
  module Containers

    class MainContainer
      include ::BottleRocket::ContentTags

      attr_reader :time_span, :units, :direction, :steps, :separators

      def initialize(time_span, units, direction, steps, separators)
        @time_span  = time_span
        @units      = units
        @direction  = direction
        @steps      = steps
        @separators = separators
      end

      def attributes
        { :class => 'countdown', :'data-direction' => direction.to_s, :'data-steps' => steps.to_s }
      end

      def to_html
        ContentTag.new(:div, attributes).to_s do
          units.map do |unit|
            UnitContainer.new(unit, time_span[unit], separators[unit]).to_html
          end.join
        end
      end

    end

  end
end