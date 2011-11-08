require 'test_helper'

class AssuntoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Assunto.new.valid?
  end
end
