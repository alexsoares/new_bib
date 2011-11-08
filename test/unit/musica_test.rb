require 'test_helper'

class MusicaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Musica.new.valid?
  end
end
