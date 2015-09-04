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


  #methods for pundit calls
  def admin?
    self.role_ids.include?(1)
  end

  def account_owner?
    self.role_ids.include?(2) || self.account.owner_id == self.id
  end

  def manager?
    self.role_ids.include?(3)
  end

  def counselor?
    self.role_ids.include?(4)
  end

  private

    #create account on user sign_up
    def set_account
      build_account unless account.present?
    end

    def assign_owner_id
      unless account.owner_id.present?
        account.owner_id = self.id
        self.role_ids = Role.find_by_name("account owner").id
      end
    end


end
