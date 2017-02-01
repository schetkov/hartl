class User < ActiveRecord::Base

  has_secure_password

  # Constants

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Validations

  validates :name, :email, presence: true
  validates :name, length: { maximum: 50 }
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password,
    presence: { on: :create },
    length: { minimum: 8, allow_blank: false },
    confirmation: { case_sensitive: true }

  # Filters

  before_save :email_downcase

  def email_downcase
    self.email = self.email.downcase
  end

end
