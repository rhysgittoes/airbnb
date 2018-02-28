class Listing < ApplicationRecord
    mount_uploaders :images, ImageUploader
	belongs_to :user
   has_many :reservations, dependent: :destroy

end