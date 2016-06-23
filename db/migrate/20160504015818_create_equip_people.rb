class CreateEquipPeople < ActiveRecord::Migration[5.0]
  def change
    create_table :equip_people do |t|
      t.string :name
      t.integer :id_attachment
      t.string :description

      t.timestamps
    end
    add_index :equip_people, :id_attachment
  end
end
