class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  def self.assignable
    where(name: ['manager', 'counselor'])
  end
end
