require 'test_helper'

class MusicNotationThoughtTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert MusicNotationThought.new.valid?
  end
  def test_search_text_simple
    t = music_notation_thoughts(:grace_notes)
    assert_equal 'Updated Grace notes', t.search_text
  end
  def test_search_text_complex
    t = music_notation_thoughts(:dusty_miller)
    assert_equal %(Trad traditional Trad This file contains some example speed 300 speed for playabc see also Playford notes E mark all tunes with an E English for the index Offord MSS from Offord manuscript Dusty Miller The title Binnys Jig an alternative title Old Sir Simon the King Hey the dusty miller and his dusty coat He will win a shilling or he spend a groat Dusty was the coat dusty was the colour Dusty was the kiss that I got frae the miller originally in C transcription notes), t.search_text
  end
end
