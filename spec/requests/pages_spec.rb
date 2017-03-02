require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /pages/home' do
    before { get "/pages/home" }
    it 'visit home page' do
      expect(response.status).to eq 200
    end
  end

  describe 'ROOT PATH' do
    before { get '/' }
    it 'visit root path' do
      expect(response.status).to eq 200
    end
  end
end