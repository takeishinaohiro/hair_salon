class RemoveMenberToHairs < ActiveRecord::Migration[5.2]
  def change
    remove_column :hairs, :menber, :string
  end
end
