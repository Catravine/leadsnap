class AddTimeLimitToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :weekly, :boolean
    remove_column :goals, :due_date
  end
end
