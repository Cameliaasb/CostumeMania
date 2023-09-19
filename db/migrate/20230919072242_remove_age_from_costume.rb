class RemoveAgeFromCostume < ActiveRecord::Migration[7.0]
  def change
    remove_column :costumes, :age, :string
  end
end
