require 'test_helper'

class FuncionarioTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Funcionario.new.valid?
  end
end
