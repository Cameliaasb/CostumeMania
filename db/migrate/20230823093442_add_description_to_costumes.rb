class AddDescriptionToCostumes < ActiveRecord::Migration[7.0]
  def change
    add_column :costumes, :description, :string
    add_column :costumes, :gender, :string
    add_column :costumes, :age, :string
  end
end
