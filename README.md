## devise-heroku

Heroku SSO authentication strategy for Devise

### Integration

Add devise-heroku to your Gemfile
```ruby
  gem 'devise-heroku', git: "http://github.com/aschepis/devise-heroku.git"
```

Add heroku_sso_authenticable to your default warden strategies in your devise.rb file
```ruby
  manager.default_strategies(:scope => :user).unshift :heroku_sso_authenticable
```

Add an initializer to set devise-heroku configuration parameters (config/initializers/devise_heroku.rb)
```ruby
  DeviseHeroku.setup do |config|
    config.resource = User
    config.sso_salt = "2D4g4a84jf03"
    config.redirect_path = '/'
  end
```

That should do it! Restart your rails server and you should be able to verify that your app works with
Heroku SSO by testing it with kensa

```console
  kensa sso 3865
```

=== Contributing

Issues and Pull Requests are welcome! This code is very preliminary and I got it up and working for my 
project. There are a number of things that I don't love but I wanted to put this out there to benefit 
others.