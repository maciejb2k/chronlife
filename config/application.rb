require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Chronlife
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.active_record.encryption.primary_key = ENV.fetch(
      "ACTIVE_RECORD_ENCRYPTION_PRIMARY_KEY", nil
    )
    config.active_record.encryption.deterministic_key = ENV.fetch(
      "ACTIVE_RECORD_ENCRYPTION_DETERMINISTIC_KEY", nil
    )
    config.active_record.encryption.key_derivation_salt = ENV.fetch(
      "ACTIVE_RECORD_ENCRYPTION_KEY_DERIVATION_SALT", nil
    )
  end
end
