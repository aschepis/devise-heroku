#DeviseHeroku::Engine.routes.draw do
Rails.application.routes.draw do
  scope :module => "DeviseHeroku" do
    post "/heroku/sso/login" => "sso#login"
  end
end