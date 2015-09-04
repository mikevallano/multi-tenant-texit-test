class Invite < ActiveRecord::Base

  require 'securerandom'

  belongs_to :sender, :class_name => 'User'
  belongs_to :receiver, :class_name => 'User'


  def generate_token
    SecureRandom.uuid + [Time.now.to_i, rand(100..1000)].join
  end


end
