class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.float :sell, null: false
      t.float :buy, null: false
      t.string :currency, null: false

      t.timestamps
    end
  end
end
