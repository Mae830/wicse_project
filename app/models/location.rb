class Location < ApplicationRecord
    has_many :favorites, dependent: :destroy

    validates :name, presence: true
    validates :street1, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zip, presence: true
end
