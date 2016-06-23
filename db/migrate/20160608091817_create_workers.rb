class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :tel

      t.timestamps
    end
  end
end
