class CreateImporters < ActiveRecord::Migration[7.2]
  def change
    create_table :importers, id: :uuid do |t|
      t.integer :state, null: false

      t.timestamps
    end
  end
end
