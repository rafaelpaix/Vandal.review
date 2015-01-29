class AddUserIdToEstampas < ActiveRecord::Migration
  def change
    add_column :estampas, :user_id, :integer
  end
end
