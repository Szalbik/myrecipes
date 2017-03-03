require 'rails_helper'

RSpec.describe Chef, type: :model do
  before do
    @chef = Chef.new(chefname: "John", email: "john@example.com")
  end

  it { expect(@chef).to be_valid }
  it { is_expected.to validate_presence_of(:chefname) }
  it { is_expected.to validate_length_of(:chefname).is_at_most(30) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_most(255) }
  it "exepect valid format for email" do
    valid_emails = %w[user@example.com MASHRUUR@gmail.com M.first@yahoo.ca john+smith@co.uk.org]
    valid_emails.each do |valids|
      is_expected.to allow_value(valids).for(:email)
    end
    invalid_emails = %w[user@example user@example,com user.name@gmail. joe@bar+foo.com]
    invalid_emails.each do |invalids|
      is_expected.to_not allow_value(invalids).for(:email)
    end
  end
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  # it "expect email to be lover case before hitting db" do
  #   mixed_email = "JoHhhhhhhN@eXaMplE.Com"
  #   @chef.email = mixed_email
  #   @chef.save
  #   expect(mixed_email.downcase).to eq(@chef.reload.email)
  # end
end