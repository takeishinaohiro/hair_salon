class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name1,null: false
      t.string :name2,null: false
      t.string :read_name1,null: false
      t.string :read_name2,null: false
      t.string :tel,null: false
      t.string :birthday,null: false
      t.string :station
      t.string :magazine
      t.string :rash
      t.timestamps
    end
  end
end
