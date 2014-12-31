class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.string :url
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :linkedin
      t.string :googleplus
      t.string :join
      t.string :donate
      t.string :related
      t.string :audio
      t.string :video
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :organizations
  end
end
