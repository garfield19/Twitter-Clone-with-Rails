class Update < ApplicationRecord
  acts_as_votable
  acts_as_commontable
	#include SimpleHashtag::Hashtaggable
	#hashtaggable_attribute :content
	require 'twitter-text'
include Twitter::Autolink
  belongs_to :user
  #has_and_belongs_to_many :tags
  validates :user_id, presence: true
  validates :content, presence: true
  default_scope -> {order(created_at: :desc)}
  
  has_attached_file :image, styles: { medium: "350x350>" },
  :storage => :cloudinary,
  :cloudinary_credentials => Rails.root.join("config/cloudinary.yml"),
  :path => ':id/:style/:filename'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  

  #after_create do
  #	update = Update.find_by(id: self.id)
  #	hashtags = self.content.scan(/#\w+/)
  #	hashtags.uniq.map do |hashtag|
  #		tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
  #		update.tags << tag
  #	end
  #end

#before_update do
 # 	update = Update.find_by(id: self.id)
  #	post.tags.clear
  #	hashtags = self.content.scan(/#\w+/)
  #	hashtags.uniq.map do |hashtag|
  #		tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
  #		update.tags << tag
  #	end
  #end

end
