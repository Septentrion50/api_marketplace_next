class CreateRealEstates < ActiveRecord::Migration[6.1]
  def change
    create_table :real_estates do |t|
      t.string :title
      t.text :description
      t.string :location
      t.integer :price

      t.timestamps
    end
  end
end
