require 'test_helper'

module BottleRocket

    class BuilderTest < TestCase
      include TimeSpanner

      before do
        from     = Time.now
        to       = from + 1
        @builder = Builder.new(from: from, to: to)
      end

      it 'should initialize with default values' do
        assert @builder.time_span.is_a?(TimeSpan)
        assert_equal Builder::DEFAULT_DIRECTION, @builder.direction
        assert_equal Builder::DEFAULT_UNITS, @builder.units
        assert_equal Builder::DEFAULT_SEPARATORS, @builder.separators
      end

      it 'creates html' do
        assert @builder.html.is_a?(String)
      end
    end

end