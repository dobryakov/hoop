class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.belongs_to :paysite, index: true
      t.belongs_to :user, index: true
      t.text :url
      t.text :description

      t.timestamps null: false
    end
    add_foreign_key :galleries, :paysites
    add_foreign_key :galleries, :users
  end
end
