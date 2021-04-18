class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :location, counter_cache: true
    validates_uniqueness_of :location_id, :scope => :user_id

    validates :user_id, presence: true
    validates :location_id, presence: true
end
