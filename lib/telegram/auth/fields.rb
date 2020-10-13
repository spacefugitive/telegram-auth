module Telegram
  class Fields
    def initialize(hash)
      @hash = hash
    end
  
    def to_s
      permitted_hash = @hash.slice(:auth_date, :id, :username, :first_name, :last_name, :photo_url)
      permitted_hash.map { |k,v| "#{k}=#{v}" }.sort.join("\n")
    end
  end
end