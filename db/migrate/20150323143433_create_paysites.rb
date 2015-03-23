class CreatePaysites < ActiveRecord::Migration
  def change
    create_table :paysites do |t|
      t.string :title
      t.belongs_to :sponsor, index: true

      t.timestamps null: false
    end
    add_foreign_key :paysites, :sponsors
  end
end
