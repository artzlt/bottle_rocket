require 'test_helper'

module BottleRocket

    class BuilderTest < TestCase
      include TimeSpanner

      before do
        @from     = Time.now
        @to       = @from + 1
        @builder = Builder.new(from: @from, to: @to)
      end

      it 'initializes with default options' do
        assert @builder.is_a?(Builder)
        assert_equal Builder::DEFAULT_DIRECTION, @builder.direction
        assert_equal Builder::DEFAULT_UNITS, @builder.units.map(&:name)

        @builder.units.each do |unit|
          assert_equal Unit::DEFAULT_SEPARATORS[unit.name], unit.separator
        end

      end

      it 'initializes with custom units' do
        builder = Builder.new(from: @from, to: @to, units: [:seconds, :milliseconds])

        assert_equal 2, builder.units.size
        assert_equal :seconds, builder.units.first.name
        assert_equal :milliseconds, builder.units.last.name
      end

      it 'initializes with unit options' do
        builder = Builder.new(from: @from, to: @to, units: [ seconds: { separator: { title: 'Sek.'}} ])

        assert_equal :seconds, builder.units.first.name
        expected = { title: 'Sek.' }
        assert_equal expected, builder.units.first.separator
      end

      it 'initializes with default and custom options' do
        builder = Builder.new(from: @from, to: @to, units: [ :minutes, seconds: { separator: { title: 'Sek.'}} ])

        assert_equal 2, builder.units.size
        assert_equal :minutes, builder.units.first.name
        expected = { title: 'm' }
        assert_equal expected, builder.units.first.separator

        assert_equal :seconds, builder.units.last.name
        expected = { title: 'Sek.' }
        assert_equal expected, builder.units.last.separator
      end

      it 'creates html' do
        assert @builder.html.is_a?(String)
      end
    end

end