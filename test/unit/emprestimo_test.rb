require 'test_helper'

class EmprestimoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Emprestimo.new.valid?
  end
end
