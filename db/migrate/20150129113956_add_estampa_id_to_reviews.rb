class AddEstampaIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :estampa_id, :integer
  end
end
