require "telegram/auth/version"
require "telegram/auth/configuration"

module Telegram
  class Error < StandardError; end
  class ConfigurationError < Error; end
  class Auth
    def self.configure(&block)
      yield(Configuration.instance) if block_given?
    end

    def self.configure!(&blk)
      configure(&blk)
      Configuration.instance.verify!
    end

    def self.configuration
      Configuration.instance
    end
  end
end