class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :author, foreign_key: {to_table: :users}
      t.references :project, foreign_key: true
      t.text :message
      t.timestamps
    end
  end
end
