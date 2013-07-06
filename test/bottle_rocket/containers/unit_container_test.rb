require 'test_helper'

module BottleRocket
  module Containers

    class UnitContainerTest < TestCase

      before do
        @unit_container = UnitContainer.new(:minutes, 1, {value: 'm'})
      end

      it 'has unit' do
        assert_equal :minutes, @unit_container.unit
      end

      it 'has amount' do
        assert @unit_container.time_unit.is_a?(AmountContainer)
      end

      it 'has separator' do
        assert @unit_container.unit_separator.is_a?(SeparatorContainer)
      end

      it 'singularizes' do
        assert @unit_container.singularize?
      end

      it 'does not singularize' do
        unit_container = UnitContainer.new(:minutes, 0, {value: 'm'})

        refute unit_container.singularize?
      end

      it 'creates html' do
        expected = '<span class="minutes"><span class="minutes-1">1</span><span class="separator minutes" data-singular="m" data-plural="m">m</span></span>'

        assert_equal expected, @unit_container.to_html
      end

    end

  end
end