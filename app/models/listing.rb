class Listing < ApplicationRecord
    mount_uploaders :images, ImageUploader
	has_one :user
   has_many :reservations, dependent: :destroy
end