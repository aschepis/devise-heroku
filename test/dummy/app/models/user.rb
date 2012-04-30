class User
  
  def self.find(id)
    if (id.to_i == 1)
      User.new
    else
      nil
    end
  end
  
  def self.serialize_into_session(obj)
    [obj]
  end
  
  def self.devise
    []
  end
end