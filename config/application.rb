require_relative "boot"

require "rails"
require "action_controller/railtie"
require "action_view/railtie"

Bundler.require(*Rails.groups)

module Bookshop
  class Application < Rails::Application
    config.load_defaults 8.1
    config.eager_load = false

    # Every file in config/locales is loaded and merged per language. Plural
    # rules come from the rails-i18n gem: six forms in Arabic, one in Japanese
    config.i18n.available_locales = %i[en ar de ja]
    config.i18n.default_locale = :en
  end
end
