class Location < ApplicationRecord
    has_many :favorites, dependent: :destroy
    belongs_to :user
    has_many :comments

    CATEGORIES = { 'Restaurant': 'restaurant', 'Dessert': 'dessert', 'Group Activity': 'group activity', 'Nature': 'nature', 'Park': 'park', 'Fun': 'fun', 'Arcade': 'arcade', 'Date Night': 'date night', 'Adventure': 'adventure', 'Family': 'family', 'Movie': 'movie', 'Alternative': 'alternative'}

    validates :name, presence: true
    validates :street1, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zip, presence: true
    validates :categories, presence: true
end
