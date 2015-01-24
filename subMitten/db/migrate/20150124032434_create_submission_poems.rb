class CreateSubmissionPoems < ActiveRecord::Migration
  def change
    create_table :submission_poems do |t|
      t.integer :submission_id, null: false
      t.integer :poem_id,       null: false
      t.string  :result,        default: "PENDING"

      t.timestamps
    end

    add_index :submission_poems, :submission_id
    add_index :submission_poems, :poem_id
    add_index :submission_poems, [:submission_id, :poem_id], unique: true
  end
end
