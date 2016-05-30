class AddDefaultToGoalsWeekly < ActiveRecord::Migration
  def change
    change_column :goals, :weekly, :boolean, :default => true
  end
end
