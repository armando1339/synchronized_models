# SynchronizedModels

Add a model into another model with an external database connection.

[![Build Status](https://travis-ci.org/armando1339/synchronized_models.svg?branch=master)](https://travis-ci.org/armando1339/synchronized_models) [![Coverage Status](https://coveralls.io/repos/github/armando1339/synchronized_models/badge.svg?branch=master)](https://coveralls.io/github/armando1339/synchronized_models?branch=master)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'synchronized_models'
```

And then execute:

```bash
$ bundle install
```

In the root directory:

```bash
$ rails generate synchronized_models_initializer
```

## Usage

Set the values of the external database in the configuration file that was created in config/initializers/synchronized_models.rb by `rails generate synchronized_models_initializer` command.

Example:

```ruby
class Account < ActiveRecord::Base
  sync_remote_model model_name: :account
end

# Then:

Account::RemoteAccount.last
Account::RemoteAccount.create name: "Some name"
```

Or:

```ruby
class Account < ActiveRecord::Base
  sync_remote_model model_name: :user
end

# Then:

Account::RemoteUser.last
Account::RemoteUser.create email: user@example.com, password: 123456
```

Or:

```ruby
class Account < ActiveRecord::Base
  sync_remote_model model_name: :user, table_name: :admins
end

# Then:

Account::RemoteUser.last
Account::RemoteUser.create email: user@example.com, password: 123456
```

## Contributing

Bug report or pull request are welcome.

Make a pull request:

- Clone the repo
- Create your feature branch
- Commit your changes
- Push the branch
- Create new Pull-Request

Please write tests if necessary.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
