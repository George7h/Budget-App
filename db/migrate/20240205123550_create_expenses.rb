class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.integer :author_id, null: false
      t.integer :group_id, null: false
      t.string :name, null: false
      t.decimal :amount, null: false

      t.timestamps
    end
    add_foreign_key :expenses, :users, column: :author_id, on_delete: :cascade
    add_foreign_key :expenses, :groups
  end
end
