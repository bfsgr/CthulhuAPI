class CreateRelations < ActiveRecord::Migration[6.0]
  def change
      create_join_table :occupations, :skills
      create_join_table :occupations, :picks
      create_join_table :skills, :picks
  end
end
