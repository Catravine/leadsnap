class CreateNos < ActiveRecord::Migration
  def change
    create_table :nos do |t|
      t.references :user, index: true, foreign_key: true
      t.references :lead, index: true, foreign_key: true
      t.datetime :date, default: Time.now

      t.timestamps null: false
    end
  end
end
