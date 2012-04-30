Warden::Strategies.add(:heroku_sso_authenticable) do 
  def valid?
    # try this strategy if correct params are present
    return !(params[:token].nil? || params[:id].nil? || params[:timestamp].nil?)
  end

  def authenticate! 
    if (params[:token].nil? || params[:id].nil? || params[:timestamp].nil?)
      fail!("invalid parameters")
      return
    end
    pre_token = params[:id] + ':' + DeviseHeroku.sso_salt + ':' + params[:timestamp]
    token = Digest::SHA1.hexdigest(pre_token).to_s

    fail!("bad token") if token != params[:token]
    fail!("bad token") if params[:timestamp].to_i < (Time.now - 2*60).to_i

    resource = DeviseHeroku.resource.find(params[:id])
    if resource
      success!(resource) 
    else
      fail!("not found")
    end
  end 
end      
