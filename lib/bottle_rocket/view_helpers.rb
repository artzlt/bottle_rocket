module BottleRocket
  module ViewHelpers

    def countdown(options={})
      safe_buffer Builder.new(options).html
    end

    def countup(options={})
      safe_buffer Builder.new(options.merge(direction: :up)).html
    end


    private

    def safe_buffer(string)
      defined?(Rails) ? ActiveSupport::SafeBuffer.new(string) : string
    end

  end
end