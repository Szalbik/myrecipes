require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before do
    @recipe = Recipe.new(name: "vegetable", description: "great vegetable recipe")
  end

  it { expect(@recipe).to be_valid }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_length_of(:description).is_at_least(5).is_at_most(500)}
end