require 'test_helper'

class LocalizacaoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Localizacao.new.valid?
  end
end
