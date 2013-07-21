require 'test_helper'

module BottleRocket
  module Containers

    class UnitContainerTest < TestCase

      before do
        @unit = Unit.new :minutes, 1
        @unit.max = 59
        @unit_container = UnitContainer.new @unit
      end

      it 'has unit' do
        assert_equal @unit, @unit_container.unit
      end

      it 'has separator container' do
        assert @unit_container.separator_container.is_a?(SeparatorContainer)
      end

      it 'has data-max-amount attribute' do
        assert_equal 59, @unit_container.attributes[:"data-max-amount"]
      end

      it 'has no data-max-amount attribute' do
        @unit.max = nil
        refute @unit_container.attributes[:"data-max-amount"]
      end

      describe 'single numbered amount' do

        it 'has amount container' do
          assert @unit_container.amount_containers.first.is_a?(AmountContainer)
        end

        it 'creates html' do
          expected = '<span class="minutes" data-amount="1" data-max-amount="59"><span class="amount amount-1">1</span><span class="separator" data-singular="m" data-plural="m">m</span></span>'

          assert_equal expected, @unit_container.to_html
        end

      end

      describe 'multi-numbered amount' do

        it 'has multiple amount containers' do
          unit = Unit.new :minutes, 12
          unit_container = UnitContainer.new unit

          assert_equal 2, unit_container.amount_containers.size
          assert_equal '1', unit_container.amount_containers.first.value
          assert_equal '2', unit_container.amount_containers.last.value
        end

        it 'handles negative unit' do
          unit = Unit.new :minutes, -12
          unit_container = UnitContainer.new unit

          assert_equal '-1', unit_container.amount_containers.first.value
          assert_equal '2', unit_container.amount_containers.last.value
        end

        it 'creates html' do
          unit = Unit.new :minutes, 37
          unit.max = 3599
          unit_container = UnitContainer.new unit

          expected = '<span class="minutes" data-amount="37" data-max-amount="3599"><span class="amount amount-3">3</span><span class="amount amount-7">7</span><span class="separator" data-singular="m" data-plural="m">m</span></span>'

          assert_equal expected, unit_container.to_html
        end

      end

    end

  end
end