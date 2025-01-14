class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.integer :user_id,null:false
      t.string :name,null:false
      t.string :tel,null:false
      t.date :data,null:false
    end

    add_index :contacts, :name, unique: true
    add_index :contacts, :tel, unique: true
  end
end
