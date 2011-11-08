require 'test_helper'

class IdentificacaoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Identificacao.new.valid?
  end
end
