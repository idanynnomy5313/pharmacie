class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.integer :id_attachment
      t.string :description

      t.timestamps
    end
  end
end
