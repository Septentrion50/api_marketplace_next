class AddReferenceToCategoryInRealEstate < ActiveRecord::Migration[6.1]
  def change
    add_reference :real_estates, :category, type: :integer, foreign_key: true
  end
end
