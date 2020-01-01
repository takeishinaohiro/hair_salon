class CreateHairs < ActiveRecord::Migration[5.2]
  def change
    create_table :hairs do |t|
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :day, null: false
      t.string :menber, null: false
      t.string :money, null: false
      t.string :menu, null: false
      t.string :memo, null: false
      t.string :category, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
