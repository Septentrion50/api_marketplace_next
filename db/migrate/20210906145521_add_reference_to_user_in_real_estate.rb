class AddReferenceToUserInRealEstate < ActiveRecord::Migration[6.1]
  def change
    add_reference :real_estates, :user, type: :integer, foreign_key: true
  end
end
