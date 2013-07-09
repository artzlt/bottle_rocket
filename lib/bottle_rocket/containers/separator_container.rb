module BottleRocket
  module Containers

    class SeparatorContainer
      include ::BottleRocket::ContentTags

      DEFAULT_SINGULARIZE = false

      attr_reader :value, :singular, :singularize

      def initialize(separator)
        @value       = separator.title
        @singular    = separator.singular_title
        @singularize = separator.singularize?
      end

      def attributes
        { :class => "separator", :'data-singular' => singular, :'data-plural' => value }
      end

      def singularize_value
        singularize ? singular : value
      end

      def to_html
        ContentTag.new(:span, attributes).to_s do
          singularize_value.to_s
        end
      end

    end

  end
end