module DeviseHeroku
  class Engine < Rails::Engine
    engine_name 'devise-heroku'
    
    initializer "devise-heroku.warden_config" do |app|
    end
  end
end
