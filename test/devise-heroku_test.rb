require 'test_helper'

class DeviseHerokuTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, DeviseHeroku
    assert_kind_of Class, DeviseHeroku::Engine
  end  
end
