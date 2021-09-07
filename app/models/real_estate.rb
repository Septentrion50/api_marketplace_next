class RealEstate < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many_attached :images

  def get_images_url
   return unless self.images.attached?
   images = []
   self.images.each do |i|
    images << Rails.application.routes.url_helpers.rails_blob_path(i, only_path: true)
   end
   return images
  end

end
