require 'singleton'

module Telegram
  class Configuration
    include Singleton
    attr_accessor :domain

    def valid?
      @errors = []
      @errors << ConfigurationError.new("Invalid Domain") unless (domain && !domain.empty?)
      @errors.none?
    end

    def verify!
      return true if valid?
      raise @errors.shift
    end
  end
end