class CreateTable < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :photo_url
      t.string :eats
      t.string :eaten_by

      t.timestamps
    end
  end
end
