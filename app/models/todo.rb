class Todo < ApplicationRecord
    belongs_to :user

    validates :name, presence: true
    validates :description, presence: true
    validates :user, presence: true
end