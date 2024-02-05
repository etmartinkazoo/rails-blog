class User < ApplicationRecord
  has_secure_password

  has_many :role_users, dependent: :destroy
  has_many :roles, through: :role_users

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_save :downcase_email

  before_create :set_roles

  private
  def set_roles
    self.role_ids = [3]
  end
  def downcase_email
    self.email = email.downcase
  end
end
