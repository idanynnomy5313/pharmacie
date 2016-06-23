class CreateInformation < ActiveRecord::Migration[5.0]
  def change
    create_table "information", :force => :cascade do |t|
	    t.string   "name"
	    t.string   "edit_title"
	    t.string   "show_title"
	    t.text     "content"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
  	end
  end
end
