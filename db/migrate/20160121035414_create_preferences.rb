class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.boolean :sweet
      t.boolean :mint
      t.boolean :salty
      t.boolean :milk_chocolate
      t.boolean :dark_chocolate
      t.boolean :caramel
      t.boolean :nuts
      t.boolean :fruity
      t.boolean :video_games
      t.boolean :socializing
      t.boolean :eating
      t.boolean :music
      t.boolean :movies
      t.boolean :indica
      t.boolean :sative
      t.boolean :hybrid
      t.string :frequency
      t.boolean :anxiety
      t.boolean :sleep
      t.boolean :pain

      t.timestamps null: false
    end
  end
end
