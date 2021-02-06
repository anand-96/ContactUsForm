class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto'

    create_table :contacts, id: :uuid do |t|
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone
      t.string :message, null: false
      t.timestamps
    end

    add_index :contacts, :email
  end
end
