class RenameColumnsToSnakeCase < ActiveRecord::Migration[6.1]
  def change
    rename_column :occupations, :calcType, :calc_type
    rename_column :skills, :baseValue, :base_value
    rename_column :picks, :pickAny, :pick_any
    rename_column :picks, :numberOfPicks, :number_of_picks
  end
end
