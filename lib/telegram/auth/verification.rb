require 'openssl'

module Telegram::Auth
  class Verification
    attr_reader :error
    
    def initialize(hash, fields)
      @fields = fields
      @hash = hash
    end

    def process
      Configuration.instance.validate! && check_sha && check_expiry
    end

    private
    def check_sha
      @error = ShaError.new("Invalid hash") unless @hash.casecmp(@fields.hash) == 0
      !@error
    end

    def check_expiry
      @error = ExpiredError.new("Expired") if @fields.expired?
      !@error
    end
  end
end