class Account < ActiveRecord::Base
  has_many :users
  has_many :posts

  mattr_accessor :current_id
end
