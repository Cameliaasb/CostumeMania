class RemoveMinDurationFromCostumes < ActiveRecord::Migration[7.0]
  def change
    remove_column :costumes, :min_duration, :integer
  end
end
