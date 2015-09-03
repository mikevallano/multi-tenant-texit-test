class Post < ActiveRecord::Base
  belongs_to :account

  default_scope { where(account_id: Account.current_id) }

  extend FriendlyId
  friendly_id :title, :use => :scoped, :scope => :account

  def should_generate_new_friendly_id?
    title_changed?
  end


end
