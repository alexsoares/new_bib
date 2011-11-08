require 'test_helper'

class PeriodicosTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Periodicos.new.valid?
  end
end
