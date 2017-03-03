class Recipe < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  validates_length_of :description, minimum: 5, maximum: 500
  validates :chef_id, presence: true
  belongs_to :chef
end