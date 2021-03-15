class Location < ApplicationRecord
    has_many :favorites, dependent: :destroy
    belongs_to :user
    has_many :comments

    #enum category: [ :restaurant, :dessert, :group, :nature, :park, :fun, :arcade, :datenight, :adventure, :karaoke, :family, :movie]

    validates :name, presence: true
    validates :street1, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zip, presence: true
end
