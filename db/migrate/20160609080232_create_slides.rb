class CreateSlides < ActiveRecord::Migration[5.0]
  def change
    create_table :slides do |t|
      t.integer :id_attachment
      t.string :description

      t.timestamps
    end
  end
end
