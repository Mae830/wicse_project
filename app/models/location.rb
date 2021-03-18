class Location < ApplicationRecord
    has_many :favorites, dependent: :destroy
    belongs_to :user
    has_many :comments

    #enum category: [ :Restaurant, :Dessert, :Group Activity, :Nature, :Park, :Fun, :Arcade, :Date Night, :Adventure, :Karaoke, :Family, :Movie]

    validates :name, presence: true
    validates :street1, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zip, presence: true
    #validates :categories, presence: true
end
