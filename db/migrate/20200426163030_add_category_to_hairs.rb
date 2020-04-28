class AddCategoryToHairs < ActiveRecord::Migration[5.2]
  def change
    add_column :hairs, :category, :integer
    add_column :hairs, :menber, :string
  end
end
