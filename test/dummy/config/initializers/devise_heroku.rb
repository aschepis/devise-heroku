DeviseHeroku.setup do |config|
  config.resource = User
  config.sso_salt = "happy day!"
  config.redirect_path = "/"
end