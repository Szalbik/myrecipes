class AddChefIdToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :chef, foreign_key: true
  end
end
