module BottleRocket
  module ViewHelpers

    def countdown(options={})
      Builder.new(options).html
    end

    def countup(options={})
      Builder.new(options.merge(direction: :up)).html
    end

  end
end