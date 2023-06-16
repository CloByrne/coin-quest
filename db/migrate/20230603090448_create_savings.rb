class CreateSavings < ActiveRecord::Migration[7.0]
  def change
    create_table :savings do |t|
      t.decimal :goal
      t.decimal :moneyInput
      t.date :date
      t.decimal :moneyOutput
      t.decimal :balance
      t.decimal :progress

      t.timestamps
    end
  end
end
