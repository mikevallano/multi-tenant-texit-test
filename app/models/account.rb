class Account < ActiveRecord::Base
  has_many :users
  has_many :posts

  def self.current_id=(id)
    Thread.current[:tenant_id] = id
  end

  def self.current_id
    Thread.current[:tenant_id]
  end
end
