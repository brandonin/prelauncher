class RemoveStrainsFromPreference < ActiveRecord::Migration
  def change
    remove_column :preferences, :hybrid, :boolean
    remove_column :preferences, :sative, :boolean
    remove_column :preferences, :indica, :boolean
  end
end
