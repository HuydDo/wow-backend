class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.integer :player_id
      t.string :gender
      t.string :name
      t.string :race
      t.string :character_class

      t.timestamps
    end
  end
end
