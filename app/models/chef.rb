class Chef < ApplicationRecord
  before_save :email_downcase
  validates :chefname, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
      format: { with: VALID_EMAIL_REGEX }
  validates :email, uniqueness: { case_sensitive: false }

  has_many :recipes

  protected

    def email_downcase
      self.email = email.downcase
    end

end