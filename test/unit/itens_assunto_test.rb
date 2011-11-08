require 'test_helper'

class ItensAssuntoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ItensAssunto.new.valid?
  end
end
