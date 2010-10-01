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
end
