class AddDemoFieldsToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :data_file_name, :string
    add_column :assets, :data_content_type, :string
    add_column :assets, :data_file_size, :integer
    add_column :assets, :data_updated_at, :datetime
    add_column :assets, :created_at, :datetime
    add_column :assets, :updated_at, :datetime
    add_column :assets, :date, :datetime
    add_column :assets, :type, :string
    add_column :assets, :title, :string
  end

  def self.down
    remove_column :assets, :data_file_name
    remove_column :assets, :data_content_type
    remove_column :assets, :data_file_size
    remove_column :assets, :data_updated_at
    remove_column :assets, :created_at
    remove_column :assets, :updated_at
    remove_column :assets, :date
    remove_column :assets, :type
    remove_column :assets, :title
  end
end
