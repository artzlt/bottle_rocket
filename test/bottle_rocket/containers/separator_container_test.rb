require 'test_helper'

module BottleRocket
  module Containers

    class UnitSeparatorBuilderTest < TestCase

      before do
        @separator_container = SeparatorContainer.new(:minutes, {value: 'm'})
      end

      it 'has value' do
        assert_equal 'm', @separator_container.value
      end

      it 'has unit' do
        assert_equal :minutes, @separator_container.unit
      end

      it 'singularizes' do
        separator_container = SeparatorContainer.new(:minutes, {value: 'minutes', singularize: true, singular: 'minute' })

        assert_equal 'minute', separator_container.singularize_value
      end

      it 'does not singularize if no singular value is given' do
        separator_container = SeparatorContainer.new(:minutes, {value: 'minutes', singularize: true })

        assert_equal 'minutes', separator_container.singularize_value
      end

      it 'does not singularize when disabled' do
        separator_container = SeparatorContainer.new(:minutes, {value: 'minutes', singularize: false, singular: 'minute' })

        assert_equal 'minutes', separator_container.singularize_value
      end

      it 'creates html' do
        expected = '<span class="separator minutes" data-singular="m" data-plural="m">m</span>'

        assert_equal expected, @separator_container.to_html
      end
    end
  end
end