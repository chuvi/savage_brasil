class CreateRatingsTable < ActiveRecord::Migration
  def self.up
    create_table :ratings, :force => true do |t|
      t.integer :vote
      t.string  :rateable_type
      t.integer :rateable_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
