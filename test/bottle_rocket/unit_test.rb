require 'test_helper'

module BottleRocket

  class UnitTest < TestCase

    it 'initializes' do
      unit = Unit.new :seconds, 1

      assert unit.is_a? Unit
      assert_equal :seconds, unit.name
      assert_equal '1', unit.amount
      refute unit.zerofy?

      expected_separator = { title: "s"}
      assert_equal expected_separator, unit.separator
    end

    it 'handles custom separator' do
      unit = Unit.new :seconds, 1, separator: { title: "blah"}

      assert unit.is_a? Unit
      assert_equal :seconds, unit.name
      assert_equal '1', unit.amount

      expected_separator = { title: "blah"}
      assert_equal expected_separator, unit.separator
    end

    it 'accepts leading zeroes (positive)' do
      unit = Unit.new :seconds, 5, leading_zeroes: true

      assert unit.zerofy?
      assert_equal '05', unit.amount
    end

    it 'accepts leading zeroes (negative)' do
      unit = Unit.new :seconds, -9, leading_zeroes: true

      assert unit.zerofy?
      assert_equal '-09', unit.amount
    end

  end

end