class WistlistItem < ApplicationRecord
    belongs_to :wishlist
    belongs_to :product
end