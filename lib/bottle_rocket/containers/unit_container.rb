module BottleRocket
  module Containers

    class UnitContainer
      include ::BottleRocket::ContentTags

      attr_reader :unit, :time_unit, :unit_separator

      def initialize(unit, unit_value, separator)
        @unit           = unit
        @time_unit      = AmountContainer.new unit, unit_value # TODO: split into multiple AmountContainers
        @unit_separator = SeparatorContainer.new separator
      end

      def to_html
        ContentTag.new(:span, class: unit.to_s).to_s do
          [time_unit.to_html, unit_separator.to_html].join
        end
      end
    end

  end
end