require 'openssl'

module Telegram
  class Verification
    SHA = 'sha256'
    attr_reader :error
    
    def initialize(hash, fields)
      @fields = fields
      @hash = hash
      @digest = OpenSSL::Digest::SHA256.new
    end

    def process
      Configuration.instance.validate! && check_sha && check_expiry
      yield(@error) if block_given? && !!@error
      !@error
    end

    private
    def check_sha
      token_sha = OpenSSL::Digest::SHA256.new.digest(Configuration.instance.token)
      check_hash = OpenSSL::HMAC.hexdigest(@digest, token_sha, @fields.to_s)
      @error = Auth::ShaError.new("Invalid hash") unless @hash.casecmp(check_hash) == 0
      !@error
    end

    def check_expiry
      @error = Auth::ExpiredError.new("Expired") if @fields.expired?
      !@error
    end
  end
end