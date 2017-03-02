require 'rails_helper'

RSpec.feature 'Successfully visit pages' do
  scenario 'should get home' do
    visit pages_home_path

    expect(current_path).to eq(pages_home_path)
  end

  scenario 'should get root' do
    visit '/'

    expect(current_path).to eq(root_path)
  end
end