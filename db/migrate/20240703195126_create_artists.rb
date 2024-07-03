class CreateArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.boolean :is_touring
      t.integer :years_active
      
      t.timestamps
    end
  end
end
