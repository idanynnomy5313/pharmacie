class CreatePromotions < ActiveRecord::Migration[5.0]
  def change
    create_table :promotions do |t|
      t.integer :id_attachment
      t.string :description

      t.timestamps
    end
  end
end
