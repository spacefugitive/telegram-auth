require 'openssl'

module Telegram
  class Verification
    class ShaError < StandardError; end;
    SHA = 'sha256'
    attr_reader :errors
    
    def initialize(hash, fields)
      @fields = fields
      @hash = hash
      @digest = OpenSSL::Digest::SHA256.new
    end

    def process
      Configuration.instance.validate! && check_sha
      yield(@error) if block_given? && !!@error
      !@error
    end

    private
    def check_sha
      token_sha = OpenSSL::Digest::SHA256.new.digest(Configuration.instance.token)
      check_hash = OpenSSL::HMAC.hexdigest(@digest, token_sha, @fields.to_s)
      @error = ShaError.new("Invalid hash") unless @hash.casecmp(check_hash) == 0
    end
  end
end