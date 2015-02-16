source 'https://rubygems.org'

# Specify your gem's dependencies in countdown.gemspec
gemspec

group :test do
  platforms :mswin, :mingw do
    gem 'win32console', '1.3.0'
  end

  gem 'minitest'
  gem 'minitest-reporters'
end

if ENV['CODECLIMATE_REPO_TOKEN']
  gem "codeclimate-test-reporter", :group => :test, :require => nil
end
