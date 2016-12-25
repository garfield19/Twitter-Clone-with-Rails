class Update < ApplicationRecord
	#include SimpleHashtag::Hashtaggable
	#hashtaggable_attribute :content
	require 'twitter-text'
include Twitter::Autolink
  belongs_to :user
  #has_and_belongs_to_many :tags
  validates :user_id, presence: true
  validates :content, presence: true
  default_scope -> {order(created_at: :desc)}

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
