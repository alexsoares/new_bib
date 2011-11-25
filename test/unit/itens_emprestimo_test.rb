require 'test_helper'

class ItensEmprestimoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ItensEmprestimo.new.valid?
  end
end
