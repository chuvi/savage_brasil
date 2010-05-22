class CreateCommentsTable < ActiveRecord::Migration
  def self.up
    create_table :comments, :force => true do |t|
      t.text    :message
      t.integer :user_id
      t.integer :commentable_id
      t.string  :commentable_type
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
