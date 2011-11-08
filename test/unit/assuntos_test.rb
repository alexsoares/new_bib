require 'test_helper'

class AssuntosTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Assuntos.new.valid?
  end
end
