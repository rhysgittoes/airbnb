class Listing < ApplicationRecord
    mount_uploaders :images, ImageUploader
    attr_accessor :file
	belongs_to :user
   has_many :reservations, dependent: :destroy

end