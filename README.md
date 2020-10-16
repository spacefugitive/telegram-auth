# telegram-auth
[![Build Status](https://travis-ci.org/spacefugitive/telegram-auth.svg?branch=main)](https://travis-ci.org/spacefugitive/telegram-auth)
[![Coverage Status](https://coveralls.io/repos/github/spacefugitive/telegram-auth/badge.svg?branch=main)](https://coveralls.io/github/spacefugitive/telegram-auth?branch=main)
[![Maintainability](https://api.codeclimate.com/v1/badges/e51b0abad88404f3517e/maintainability)](https://codeclimate.com/github/spacefugitive/telegram-auth/maintainability)
[![Gem Version](https://badge.fury.io/rb/telegram-auth.svg)](https://badge.fury.io/rb/telegram-auth)

Gem to implement authorization checks for telegram logins outlined [here](https://core.telegram.org/widgets/login#checking-authorization).

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

# Usage

```
  Telegram::Auth.create(hash:, username: id: first_name: last_name: auth_date: photo_url:) do |error|
    Telegram::Auth.logger.debug(error.message)
  end
```

# Logging

Auth failures are logged at DEBUG to STDOUT. To configure your own logger:
```
Telegram::Auth.logger = Rails.logger #or your logger
Telegram::Auth.logger.level = Logger::WARN
```

# Supported versions

- Jruby
- Ruby
