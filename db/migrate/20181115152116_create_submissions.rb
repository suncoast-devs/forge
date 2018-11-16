class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.references :project, foreign_key: true
      t.references :author, foreign_key: {to_table: :users}
      t.references :accepted_by, foreign_key: {to_table: :users}
      t.integer :status
      t.text :memo
      t.boolean :is_paid
      t.timestamps
    end
  end
end
