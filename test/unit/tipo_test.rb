require 'test_helper'

class TipoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Tipo.new.valid?
  end
end
