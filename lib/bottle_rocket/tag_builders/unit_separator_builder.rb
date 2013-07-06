module BottleRocket
  module TagBuilders

    class UnitSeparatorBuilder
      include ::BottleRocket::ContentTags

      DEFAULT_SINGULARIZE = false

      attr_reader :unit, :value, :singular, :singularize

      def initialize(unit, options={})
        @unit        = unit
        @value       = options.delete(:value)
        @singular    = options.delete(:singular)
        @singularize = options.delete(:singularize) || DEFAULT_SINGULARIZE
      end

      def attributes
        { :class => "separator #{unit}", :'data-singular' => (singular || value), :'data-plural' => value }
      end

      def singularize_value
        singular && singularize ? singular : value
      end

      def to_html
        ContentTag.new(:span, attributes).to_s do
          singularize_value.to_s
        end
      end

    end

  end
end