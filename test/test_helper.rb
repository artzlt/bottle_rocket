require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/reporters'
require 'bottle_rocket'

#MiniTest::Reporters.use!

class TestCase < Minitest::Spec
end

class FakeView
  include ::BottleRocket::ViewHelpers
end