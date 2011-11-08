require 'test_helper'

class DicionarioEnciclopediaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert DicionarioEnciclopedia.new.valid?
  end
end
