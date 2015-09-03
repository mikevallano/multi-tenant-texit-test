class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.integer :account_id
      t.integer :sender_id
      t.integer :receiver_id
      t.string :token
      t.integer :role_ids

      t.timestamps null: false
    end
  end
end
