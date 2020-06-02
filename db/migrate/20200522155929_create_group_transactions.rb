class CreateGroupTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :group_transactions do |t|
      t.references :group, foreign_key: true
      t.references :transaction, foreign_key: true

      t.timestamps
    end
  end
end
