require 'test_helper'

module BottleRocket

  class UnitTest < TestCase

    it 'initializes' do
      unit = Unit.new :seconds, 1

      assert unit.is_a? Unit
      assert_equal :seconds, unit.name
      assert_equal 1, unit.amount
      assert_equal '1', unit.stringified_amount

      expected_separator = 's'
      assert_equal expected_separator, unit.separator.title
    end

    it 'handles custom separator' do
      unit = Unit.new :seconds, 1, separator: { title: "blah"}

      assert unit.is_a? Unit
      assert_equal :seconds, unit.name
      assert_equal '1', unit.stringified_amount

      expected_separator = "blah"
      assert_equal expected_separator, unit.separator.title
    end

    it 'accepts leading zeroes (positive)' do
      unit = Unit.new :seconds, 5, leading_zeroes: true

      assert_equal '05', unit.stringified_amount
    end

    it 'accepts leading zeroes (negative)' do
      unit = Unit.new :seconds, -9, leading_zeroes: true

      assert_equal '-09', unit.stringified_amount
    end

    it 'singularizes' do
      [-1, 1].each do |n|
        unit = Unit.new(:minutes, n)

        assert unit.singularize?
      end
    end

    it 'does not singularize' do
      [3, -4].each do |n|
        unit = Unit.new(:minutes, n)

        refute unit.singularize?
      end
    end

  end

end