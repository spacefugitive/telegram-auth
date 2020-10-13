require 'openssl'

module Telegram
  class Verification
    def self.create(hash, fields)
      fields_string = Fields.new(fields).to_s
      token_sha = OpenSSL::Digest::SHA256.new.digest(Configuration.instance.token)
      check_hash = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new(OpenSSL::Digest.new('sha256')), token_sha, fields_string)
      hash.casecmp(check_hash) == 0
    end
  end
end