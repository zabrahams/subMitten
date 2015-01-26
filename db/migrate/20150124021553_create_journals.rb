class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string   :name, null: false
      t.string   :email
      t.text     :address
      t.boolean  :simul_submit
      t.string   :url
      t.string   :phone_number

      t.timestamps
    end

    add_index :journals, :name, unique: true
  end
end
