require 'time_spanner'

require 'bottle_rocket/version'
require 'bottle_rocket/content_tag'
require 'bottle_rocket/tag_builders'
require 'bottle_rocket/view_helpers'

if defined? Rails
  require 'bottle_rocket/engine' if ::Rails.version >= '3.1'
  require 'bottle_rocket/railtie'
end