class AddIndexesToInvites < ActiveRecord::Migration
  def change
    add_index :invites, :email
    add_index :invites, :token
  end
end
