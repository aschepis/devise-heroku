#DeviseHeroku::Engine.routes.draw do
Rails.application.routes.draw do
  scope :module => "devise_heroku" do
    post "/heroku/sso/login" => "sso#login"
  end
end