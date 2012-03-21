class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, :precision => 8, :scale => 2 # scale is number of digits after decimal pt

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
