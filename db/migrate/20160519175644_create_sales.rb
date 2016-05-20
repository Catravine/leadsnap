class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :user, index: true, foreign_key: true
      t.references :lead, index: true, foreign_key: true
      t.datetime :date
      t.integer :amount

      t.timestamps null: false
    end
  end
end
