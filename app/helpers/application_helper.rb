module ApplicationHelper

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
def randomized_background_image
  images = ["/0.jpg", "/1.jpg"]
  images[rand(images.size)]
end
end
