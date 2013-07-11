module BottleRocket
  module Containers

    class AmountContainer
      include ::BottleRocket::ContentTags

      attr_reader :value

      def initialize(value)
        @value = value
      end

      def to_html
        ContentTag.new(:span, class: "amount-#{value}").to_s do
          value.to_s
        end
      end
    end

  end
end