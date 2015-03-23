class AddContentTypeToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :content_type, :string
  end
end
