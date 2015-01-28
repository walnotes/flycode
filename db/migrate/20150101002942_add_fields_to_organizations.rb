class AddFieldsToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :audio, :string
    add_column :organizations, :video, :string
  end
end
