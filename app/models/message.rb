class Message < ApplicationRecord
	belongs_to :user
	has_many :comments
	belongs_to :category
	#mount_uploader :avatar, AvatarUploader
end
