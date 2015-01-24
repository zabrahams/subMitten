class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.string :title, null: false
      t.string :status, null: false, default: "NONE"
      t.datetime :written_on, null: false

      t.timestamps
    end
  end
end
