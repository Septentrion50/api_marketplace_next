class RealEstate < ApplicationRecord

  include ActiveModel::Serializers::JSON

  belongs_to :user
  belongs_to :category

  has_many_attached :images

  def attributes
    {
      'id': nil,
      'title': nil,
      'description': nil,
      'location': nil,
      'address': nil,
      'price': nil,
      'category': nil,
      'user': nil,
      'updated_at': nil,
      'created_at': nil,
      'images_url': nil
    }
  end

  def images_url
    images = []
    self.images.each do |image|
      images << Rails.application.routes.url_helpers.rails_representation_url(
        image.variant(resize_to_limit: [200, 200]).processed, only_path: true
      )
    end
    return images
  end

end
