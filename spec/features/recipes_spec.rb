require 'rails_helper'

RSpec.feature "Recipes", type: :feature do
  before do
    @chef = Chef.create!(chefname: "Damian", email: "damian@example.com")
    @recipe1 = @chef.recipes.create!(name: "Recipe 1", description: "Awesome recipe")
    @recipe2 = Recipe.create!(name: "Recipe 2", description: "Awesome recipe", chef: @chef)
  end

  scenario "should get recipes index" do
    visit recipes_url
    expect(current_path).to eq(recipes_path)
    expect(page).to have_content(@recipe1.name)
    expect(page).to have_content(@recipe2.name)
  end
end
