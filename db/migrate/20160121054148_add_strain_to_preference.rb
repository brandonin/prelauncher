class AddStrainToPreference < ActiveRecord::Migration
  def change
    add_column :preferences, :strain, :string
  end
end
