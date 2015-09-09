class CreateArtists < ActiveRecord::Migration
  def change
      create_table :animal do |t|
        t.string :name
        t.string :photo_url
        t.string :kind
        t.string :eats 

        t.timestamps 
      end
  end
end
