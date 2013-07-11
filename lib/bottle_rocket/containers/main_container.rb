module BottleRocket
  module Containers

    class MainContainer
      include ::BottleRocket::ContentTags

      attr_reader :time_span, :units, :direction, :steps, :separators

      def initialize(units, direction, steps)
        @units      = units
        @direction  = direction
        @steps      = steps
      end

      def attributes
        { :class => 'countdown', :'data-direction' => direction.to_s, :'data-steps' => steps.to_s }
      end

      def to_html
        ContentTag.new(:div, attributes).to_s do
          units.map do |unit|
            UnitContainer.new(unit).to_html
          end.join
        end
      end

    end

  end
end