json.array!(@invites) do |invite|
  json.extract! invite, :id, :email, :account_id, :sender_id, :receiver_id, :token, :role_ids
  json.url invite_url(invite, format: :json)
end
