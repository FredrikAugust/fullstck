require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Homepage
  # configurations for the most part
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
