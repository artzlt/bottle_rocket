module BottleRocket
  module Containers

    class MainContainer
      include ::BottleRocket::ContentTags

      attr_reader :time_span, :units, :unit_list, :direction, :steps, :separators

      def initialize(unit_list, direction, steps)
        @unit_list  = unit_list
        @direction  = direction
        @steps      = steps
      end

      def attributes
        { :class => 'countdown', :'data-direction' => direction.to_s, :'data-steps' => steps.to_s }
      end

      def to_html
        ContentTag.new(:div, attributes).to_s do
          unit_list.map do |unit|
            UnitContainer.new(unit).to_html
          end.join
        end
      end

    end

  end
end