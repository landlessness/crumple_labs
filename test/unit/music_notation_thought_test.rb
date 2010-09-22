require 'test_helper'

class MusicNotationThoughtTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert MusicNotationThought.new.valid?
  end
end
