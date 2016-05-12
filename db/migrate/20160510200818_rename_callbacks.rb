class RenameCallbacks < ActiveRecord::Migration
  def self.up
    rename_table :callbacks, :recalls
  end

  def self.down
    rename_table :recalls, :callbacks
  end
end
