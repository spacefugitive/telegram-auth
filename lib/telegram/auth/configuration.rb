require "singleton"

module Telegram
  class Configuration
    include Singleton
    attr_accessor :token
    attr_accessor :auth_expires_in

    def valid?
      @errors = []
      @errors << Auth::ConfigurationError.new("Invalid token") if (!token || token.empty?)
      @errors.none?
    end

    def validate!
      valid? or raise @errors.first
    end

    def verify!
      return true if valid?
      raise @errors.shift
    end
  end
end