require 'test_helper'

class AudioVisualTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert AudioVisual.new.valid?
  end
end
