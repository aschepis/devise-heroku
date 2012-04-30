require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest

  setup :set_salt
  
  test "fail if missing params" do
    id, timestamp, token = valid_token

    post "/heroku/sso/login", :token => token
    assert_equal 302, status
    assert_equal "/unauthenticated", path

    post "/heroku/sso/login", :id => id
    assert_equal 302, status
    assert_equal "/unauthenticated", path

    post "/heroku/sso/login", :timestamp => timestamp
    assert_equal 302, status
    assert_equal "/unauthenticated", path

    post "/heroku/sso/login", :id => id, :timestamp => timestamp
    assert_equal 302, status
    assert_equal "/unauthenticated", path

    post "/heroku/sso/login", :token => token, :timestamp => timestamp
    assert_equal 302, status
    assert_equal "/unauthenticated", path

    post "/heroku/sso/login", :token => token, :id => id
    assert_equal 302, status
    assert_equal "/unauthenticated", path
  end

  test "fail if bad token" do
    id, timestamp, token = valid_token

    post "/heroku/sso/login", :id => id, :timestamp => timestamp, :token => "someOtherToken"
    assert_equal 302, status
    assert_equal "/heroku/sso/login", path
  end

  test "fail if old token" do
    id, timestamp, token = old_token

    post "/heroku/sso/login", :id => id, :timestamp => timestamp, :token => token
    assert_equal 302, status
    assert_equal "/heroku/sso/login", path
  end

  test "fail if old not found" do
    id, timestamp, token = valid_token(2)
    post "/heroku/sso/login", :id => id, :timestamp => timestamp, :token => token
    assert_equal 302, status
    assert_equal "/unauthenticated", path
  end
  
  test "succeeds with valid token" do
    id, timestamp, token = valid_token(1)
    post "/heroku/sso/login", :id => id, :timestamp => timestamp, :token => token

    assert_equal 302, status
    assert_equal "/heroku/sso/login", path
    assert_redirected_to "/"
  end
  
private
  def set_salt
    # must match value in dummy app initializer
    @sso_salt = "happy day!"
  end

  def valid_token(id = 1)
    timestamp = Time.now.getutc
    pre_token = "#{id}:#{@sso_salt}:#{@timestamp}"
    [id, timestamp,  Digest::SHA1.hexdigest(pre_token).to_s]
  end
  
  def old_token(id = 1)
    time = Time.at(0)
    timestamp = time.getutc
    pre_token = "#{id}:#{@sso_salt}:#{@timestamp}"
    [id, timestamp,  Digest::SHA1.hexdigest(pre_token).to_s]
  end    
end

