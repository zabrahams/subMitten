class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer  :journal_id,  null: false
      t.datetime :date_made,   null: false
      t.string   :result,      default: "PENDING"

      t.timestamps
    end

    add_index :submissions, :journal_id
  end
end
