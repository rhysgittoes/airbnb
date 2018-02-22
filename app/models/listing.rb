class Listing < ApplicationRecord
	has_one :user
   has_many :reservations
end