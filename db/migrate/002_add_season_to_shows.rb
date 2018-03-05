# write a migration to add a column, season, to the shows table. The datatype of this column is string.

class AddSeasonToShows < ActiveRecord::Migration
  def change
    add_column :shows, :season, :string
  end
end
