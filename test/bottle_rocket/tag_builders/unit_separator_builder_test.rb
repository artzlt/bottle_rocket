require 'test_helper'

module BottleRocket
  module TagBuilders

    class UnitSeparatorBuilderTest < TestCase

      before do
        @separator = UnitSeparatorBuilder.new(:minutes, {value: 'm'})
      end

      it 'has value' do
        assert_equal 'm', @separator.value
      end

      it 'has unit' do
        assert_equal :minutes, @separator.unit
      end

      it 'singularizes' do
        separator = UnitSeparatorBuilder.new(:minutes, {value: 'minutes', singularize: true, singular: 'minute' })

        assert_equal 'minute', separator.singularize_value
      end

      it 'does not singularize if no singular value is given' do
        separator = UnitSeparatorBuilder.new(:minutes, {value: 'minutes', singularize: true })

        assert_equal 'minutes', separator.singularize_value
      end

      it 'does not singularize when disabled' do
        separator = UnitSeparatorBuilder.new(:minutes, {value: 'minutes', singularize: false, singular: 'minute' })

        assert_equal 'minutes', separator.singularize_value
      end

      it 'creates html' do
        expected = '<span class="separator minutes" data-singular="m" data-plural="m">m</span>'

        assert_equal expected, @separator.to_html
      end
    end
  end
end