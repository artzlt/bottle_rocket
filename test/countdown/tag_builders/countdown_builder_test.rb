require 'test_helper'

module Countdown
  module TagBuilders

    class CountdownBuilderTest < TestCase

      before do
        from = Time.now
        to   = from + 1
        @counter = CountdownBuilder.new(from: from, to: to)
      end

      it 'should initialize with default values' do
        assert @counter.time_span.is_a?(Hash)
        assert_equal CountdownBuilder::DEFAULT_DIRECTION, @counter.direction
        assert_equal CountdownBuilder::DEFAULT_UNITS, @counter.units
        assert_equal CountdownBuilder::DEFAULT_SEPARATORS, @counter.separators
      end

      it 'creates html' do
        assert @counter.to_html.is_a?(String)
      end
    end

  end
end