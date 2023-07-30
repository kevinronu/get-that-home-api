class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :property, counter_cache: true

  validates :user,
            uniqueness: { scope: :property, message: "and Property combination already taken" }
end
