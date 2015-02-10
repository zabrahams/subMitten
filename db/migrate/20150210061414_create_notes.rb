class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
    t.text    :body,         null: false
    t.integer :notable_id,   null: false
    t.string  :notable_type, null: false

    t.timestamps
    end

    add_index :notes, :notable_id
  end
end
