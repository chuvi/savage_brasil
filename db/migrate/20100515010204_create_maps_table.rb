class CreateMapsTable < ActiveRecord::Migration
  def self.up
    create_table :maps, :force => true do |t|
      t.string :name
      t.string :author
      t.string :description
      t.string :dimensions
      t.string :status
      t.integer :teams
      t.integer :flags
      t.integer :gold_mines
      t.integer :red_mines
      t.integer :npcs
      t.integer :chiprels
      t.string :category
      t.string :newerth_link
      t.integer :derived_from_id
      t.integer :rating
      t.timestamps
    end
  end

  def self.down
    drop_table :maps
  end
end
