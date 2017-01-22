class Message < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_many :users, through: :comments
	belongs_to :category
	#mount_uploader :avatar, AvatarUploader
end
