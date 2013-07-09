require 'test_helper'

module BottleRocket
  module Containers

    class SeparatorContainerTest < TestCase

      before do
        separator = Separator.new :minutes
        @separator_container = SeparatorContainer.new separator
      end

      it 'has value' do
        assert_equal 'm', @separator_container.value
      end

      it 'singularizes value' do
        separator = Separator.new :minutes, singular: 'minute', singularize: true
        separator_container = SeparatorContainer.new separator

        assert_equal 'minute', separator_container.singularize_value
      end

      it 'uses title when no singular title is given' do
        separator = Separator.new :minutes, singularize: true
        separator_container = SeparatorContainer.new separator

        assert_equal 'm', separator_container.singularize_value
      end

      it 'uses title when it does not singularize' do
        separator = Separator.new :minutes, singular: 'minute', singularize: false
        separator_container = SeparatorContainer.new separator

        assert_equal 'm', separator_container.singularize_value
      end

      it 'creates html' do
        expected = '<span class="separator" data-singular="m" data-plural="m">m</span>'

        assert_equal expected, @separator_container.to_html
      end
    end
  end
end