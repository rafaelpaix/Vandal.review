class CreateEstampas < ActiveRecord::Migration
  def change
    create_table :estampas do |t|
      t.string :title
      t.text :description
      t.string :criador
      t.string :rating

      t.timestamps null: false
    end
  end
end
