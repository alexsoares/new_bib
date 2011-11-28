require 'test_helper'

class ConfiguracaoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Configuracao.new.valid?
  end
end
