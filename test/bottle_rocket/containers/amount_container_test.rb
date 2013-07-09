require 'test_helper'

module BottleRocket
  module Containers

    class AmountContainerTest < TestCase

      before do
        @amount_container = AmountContainer.new(:minutes, 1)
      end

      it 'has value' do
        assert_equal 1, @amount_container.value
      end

      it 'has unit' do
        assert_equal :minutes, @amount_container.unit
      end

      it 'creates html' do
        assert_equal '<span class="minutes-1">1</span>', @amount_container.to_html
      end
    end

  end
end