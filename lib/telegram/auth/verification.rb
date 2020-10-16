require 'openssl'

module Telegram
  class Verification
    attr_reader :error
    
    def initialize(hash, fields)
      @fields = fields
      @hash = hash
    end

    def process
      Configuration.instance.validate! && check_sha && check_expiry
      yield(@error) if block_given? && !!@error
      !@error
    end

    private
    def check_sha
      @error = Auth::ShaError.new("Invalid hash") unless @hash.casecmp(@fields.hash) == 0
      !@error
    end

    def check_expiry
      @error = Auth::ExpiredError.new("Expired") if @fields.expired?
      !@error
    end
  end
end