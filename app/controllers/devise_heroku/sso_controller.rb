class DeviseHeroku::SsoController < ApplicationController
  
  before_filter "authenticate_#{DeviseHeroku.resource.to_s.parameterize.underscore}!".to_sym

  def login
    redirect_to DeviseHeroku.redirect_path
  end
end
