class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :length
      t.boolean :is_single
      t.belongs_to :artist, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
