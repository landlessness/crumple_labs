class MusicNotationThought < ActiveRecord::Base
  attr_accessible :body
  def search_text
    # see http://abcnotation.com/abc2mtex/abc.txt
    # TODO: need to handle multiple line text for H
    # and text after % on every line
    %w(A B C D G H I N O S T W Z).map do |f|
      self.body.scan(/^\s*#{f}:(.*)$/).join(' ')
    end.join(' ').gsub(/[^ 0-9A-Za-z_]/,'').squeeze("\s").strip
  end
  def example_body
%(% for info on notation: http://abcnotation.com/abc2mtex/abc.txt
%
% a percent sign denotes the beginning of a comment
%
% T: is for the title
T: Title
%
% M: is the meter
M: 4/4
%
% K: is the key. # for sharp and b for flat
K: Ab
%
% L: is the default note length
L: 1/4
%
% uppercase is the bottom octave: C
% lower case is the top octave: c
% to go down an octave follow the letter with one or more commas: C,,
% to go up an octave follow the letter with one or more apostrophes: C'''
[|:C, C c c' | c' c C C,:|]
%
% to create a longer note follow the letter by a number: c'4
[|:c4 | c3 c | c2 c2:|]
%
% to create shorter notes follow the letter by a forward slash and a number: C/16
% for beams put notes next to each other with no space: C,/16C/16c/16c'/16
[|:c/4c/4c/4c/4 c/2c/2 c/2 c/2 c:|]
%
% to create broken rhythms, like dotted eighth sixteenth notes use greater or less than: c/2<c/2
[|:c/2>c/2 c c/2<c/2 c:|]
)
  end
end
