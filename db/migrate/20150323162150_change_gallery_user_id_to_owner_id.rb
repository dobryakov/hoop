class ChangeGalleryUserIdToOwnerId < ActiveRecord::Migration
  def up
    rename_column :galleries, :user_id, :owner_id
  end
  def down
    rename_column :galleries, :owner_id, :user_id
  end
end
