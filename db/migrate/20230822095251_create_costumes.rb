class CreateCostumes < ActiveRecord::Migration[7.0]
  def change
    create_table :costumes do |t|
      t.integer :min_duration
      t.integer :price
      t.string :condition
      t.string :size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
