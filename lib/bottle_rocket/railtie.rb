module BottleRocket
  class Railtie < ::Rails::Railtie
    initializer 'countdown.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end