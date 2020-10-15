module Telegram
  class Fields
    def initialize(hash)
      @hash = hash
    end

    def expired?(time = Time.now.to_i)
      return false unless Configuration.instance.auth_expires_in.present?
      time > @hash[:auth_date] + Configuration.instance.auth_expires_in
    end
  
    def to_s
      permitted_hash = @hash.slice(:auth_date, :id, :username, :first_name, :last_name, :photo_url)
      permitted_hash.map { |k,v| "#{k}=#{v}" }.sort.join("\n")
    end
  end
end