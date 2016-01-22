class AddAdventuringToPreference < ActiveRecord::Migration
  def change
    add_column :preferences, :adventuring, :boolean
  end
end
