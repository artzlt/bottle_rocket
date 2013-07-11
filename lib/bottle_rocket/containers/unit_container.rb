module BottleRocket
  module Containers

    class UnitContainer
      include ::BottleRocket::ContentTags

      attr_reader :unit, :amount_containers, :separator_container

      def initialize unit
        @unit                = unit
        @amount_containers   = splitted_numbers.map { |num| AmountContainer.new num }
        @separator_container = SeparatorContainer.new unit.separator
      end

      def to_html
        ContentTag.new(:span, class: unit.name.to_s).to_s do
          [amount_containers.map(&:to_html).join, separator_container.to_html].join
        end
      end

      private

      def splitted_numbers
        numbers = unit.amount.to_s.chars - ['-']
        numbers[0] = (numbers[0].to_i*-1).to_s if unit.amount < 0
        numbers
      end

    end

  end
end