class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.date :deadline_on
      t.integer :bid
      t.integer :status
      t.references :requested_by, foreign_key: {to_table: :users}
      t.references :authorized_by, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
