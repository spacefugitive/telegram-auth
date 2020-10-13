require 'openssl'

module Telegram
  class Verification
    SHA = 'sha256'
    attr_reader :error
    
    def initialize(hash, fields)
      @fields = fields
      @hash = hash
      @digest = OpenSSL::Digest::SHA256.new
      @error = nil
    end

    def process
      token_sha = OpenSSL::Digest::SHA256.new.digest(Configuration.instance.token)
      check_hash = OpenSSL::HMAC.hexdigest(@digest, token_sha, @fields.to_s)
      error = 'Invalid Auth Data.' unless @hash.casecmp(check_hash) == 0
      !error
    end
  end
end