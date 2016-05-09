class CreateCallbacks < ActiveRecord::Migration
  def change
    create_table :callbacks do |t|
      t.references :user, index: true, foreign_key: true
      t.references :lead, index: true, foreign_key: true
      t.datetime :time
      t.text :notes

      t.timestamps null: false
    end
  end
end
