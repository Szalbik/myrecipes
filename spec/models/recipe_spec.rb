require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @chef = Chef.create!(chefname: "John", email: "john@example.com")
    @recipe = @chef.recipes.build(name: "vegetable", description: "great vegetable recipe")
  end

  it { expect(@recipe).to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_length_of(:description).is_at_least(5).is_at_most(500)}
  it { is_expected.to belong_to(:chef) }
  it "expect recipe without chef to be invalid" do
    @recipe.chef_id = nil
    expect(@recipe).to_not be_valid
  end
end