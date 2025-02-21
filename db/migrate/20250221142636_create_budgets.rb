class CreateBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :category, null: false, default: 0
      t.string :title
      t.string :body
      t.integer :amount, null: false, default: 0
      t.datetime :payment_date

      t.timestamps
    end
  end
end
