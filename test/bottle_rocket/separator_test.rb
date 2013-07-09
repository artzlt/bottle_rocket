require 'test_helper'

module BottleRocket

  class SeparatorTest < TestCase

    it 'initializes' do
      separator = Separator.new :days

      assert separator.is_a? Separator
      assert_equal 'd', separator.title
      assert_equal 'd', separator.singular_title
      refute separator.singularize?
    end

    it 'is singular?' do
      separator = Separator.new :days, singularize: true

      assert separator.singularize?
    end

    it 'singular title with with option' do
      separator = Separator.new :days, singular: 'day'

      assert_equal 'd', separator.title
      assert_equal 'day', separator.singular_title
    end

  end

end