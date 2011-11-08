require 'test_helper'

class UnidadeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Unidade.new.valid?
  end
end
