class CreateMovements < ActiveRecord::Migration[7.2]
  def change
    create_table :movements, id: :uuid do |t|
      t.string :kind, null: false
      t.date :occurred_on, null: false
      t.decimal :value, null: false
      t.string :personal_code, null: false
      t.string :card_number, null: false
      t.time :occurred_at, null: false

      t.references :store, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
