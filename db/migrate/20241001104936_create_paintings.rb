class CreatePaintings < ActiveRecord::Migration[8.0]
  def change
    create_table :paintings do |t|
      t.string :color

      t.timestamps
    end
  end
end
