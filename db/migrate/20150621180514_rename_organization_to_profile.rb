class RenameOrganizationToProfile < ActiveRecord::Migration
  def change
    rename_table :organizations, :profiles
  end
end
