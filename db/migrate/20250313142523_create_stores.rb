class CreateStores < ActiveRecord::Migration[7.2]
  def change
    create_table :stores, id: :uuid do |t|
      t.string :name, null: false
      t.string :owner_name, null: false

      t.timestamps
    end

    add_index :stores, :name, unique: true
  end
end
