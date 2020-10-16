require "telegram/auth/version"
require "telegram/auth/configuration"
require "telegram/auth/fields"
require "telegram/auth/verification"
require "logger"

module Telegram
  module Auth
    class Error < StandardError; end
    class ConfigurationError < Error; end
    class ShaError < Error; end;
    class ExpiredError < Error; end;
    def self.configure(&block)
      yield(Configuration.instance) if block_given?
    end

    def self.configure!(&blk)
      configure(&blk)
      Configuration.instance.verify!
    end

    def self.create(hash:, **field_data)
      verification = Verification.new(hash, Fields.new(field_data))
      success = verification.process
      yield(verification.error) if !success && block_given?
      success
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