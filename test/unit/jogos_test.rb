require 'test_helper'

class JogosTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Jogos.new.valid?
  end
end
