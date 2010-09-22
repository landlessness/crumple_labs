class CreateMusicNotationThoughts < ActiveRecord::Migration
  def self.up
    create_table :music_notation_thoughts do |t|
      t.text :body
      t.timestamps
    end
  end
  
  def self.down
    drop_table :music_notation_thoughts
  end
end
