class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :account
      t.string :name1
      t.string :name2
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone1
      t.string :phone2
      t.string :phone3
      t.string :source_code

      t.timestamps null: false
    end
  end
end
