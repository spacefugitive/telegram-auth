require "telegram/auth/version"
require "telegram/auth/configuration"
require "telegram/auth/fields"
require "telegram/auth/verification"
require "logger"

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

    def create(hash, field_data)
      Verification.new(hash, Fields.new(field_data)).process
    end

    def self.logger=(logger)
      @logger = logger
    end

    def self.logger
      @logger
    end
  end
end

Telegram::Auth.logger = Logger.new(STDOUT)
Telegram::Auth.logger.level = Logger::DEBUG