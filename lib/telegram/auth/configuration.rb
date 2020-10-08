require 'singleton'

module Telegram
  class Configuration
    include Singleton
    attr_accessor :token

    def valid?
      @errors = []
      @errors << ConfigurationError.new("Invalid token") unless (token && !token.empty?)
      @errors.none?
    end

    def verify!
      return true if valid?
      raise @errors.shift
    end
  end
end