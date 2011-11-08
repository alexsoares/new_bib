require 'test_helper'

class LivroTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Livro.new.valid?
  end
end
