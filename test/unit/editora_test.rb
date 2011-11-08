require 'test_helper'

class EditoraTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Editora.new.valid?
  end
end
