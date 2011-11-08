require 'test_helper'

class AutorTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Autor.new.valid?
  end
end
