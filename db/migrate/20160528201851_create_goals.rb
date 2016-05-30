class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :amount, default: 0
      t.datetime :due_date, default: Date.today
      t.boolean :individual, default: false
      t.references :campaign, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
