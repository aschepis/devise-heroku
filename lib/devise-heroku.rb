require File.expand_path('../devise-heroku/engine', __FILE__)
require File.expand_path('../devise-heroku/version', __FILE__)

module DeviseHeroku
  
  def self.setup
    yield self
  end
  
  mattr_accessor :sso_salt
  @@sso_salt = '<YOU FORGOT TO SET THIS>'

  mattr_accessor :redirect_path
  @@redirect_path = '/'
  
  mattr_accessor :resource
  @@resource = nil  
end
