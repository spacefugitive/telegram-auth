# telegram-auth
[![Build Status](https://travis-ci.org/spacefugitive/telegram-auth.svg?branch=main)](https://travis-ci.org/spacefugitive/telegram-auth)
[![Coverage Status](https://coveralls.io/repos/github/spacefugitive/telegram-auth/badge.svg?branch=main)](https://coveralls.io/github/spacefugitive/telegram-auth?branch=main)
[![Maintainability](https://api.codeclimate.com/v1/badges/e51b0abad88404f3517e/maintainability)](https://codeclimate.com/github/spacefugitive/telegram-auth/maintainability)

Gem to verify auth for a telegram domain.

# Installation

`gem install telegram-auth`

Interactive console at `bin/console` from source.

# Configuration
  ```
  Telegram::Auth.configure do |c|
    c.token = "XXXXX" #get this from the telegram domain bot      
    c.auth_expires_in = 1.hour.to_i #optional
  end
  ```
  
  To raise an error for invalid configuration use:
  ```
   Telegram::Auth.configure!{ |c| ... } 
  ```

# Logging

  Auth failures are logged at DEBUG to STDOUT. To configure your own logger:
  ```
  Telegram::Auth.logger = Rails.logger #or your logger
  Telegram::Auth.logger.level = Logger::WARN
  ```

# supported versions
- Jruby
- Ruby
