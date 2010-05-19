class CreateEventsTable < ActiveRecord::Migration
  def self.up
    create_table :events, :force => true do |t|
      t.string :message
      t.integer :user_id
      t.integer :image_id
      t.integer :comment_id
      t.integer :map_id
      t.integer :demo_id
      t.string  :kind
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
