class User < ActiveRecord::Base

  default_scope { where(account_id: Account.current_id) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :account
  has_and_belongs_to_many :roles
  has_many :invitations, :class_name => "Invite", :foreign_key => 'receiver_id'
  has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'

  accepts_nested_attributes_for :account

  after_initialize :set_account
  after_save :assign_owner_id

  private

    def set_account
      build_account unless account.present?
    end

    def assign_owner_id
      account.owner_id = self.id unless account.owner_id.present?
    end


end
