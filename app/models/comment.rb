class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :location

    validates :body, presence: true, length: { minimum: 10 }
end
