class User < ApplicationRecord
  before_validation :normalize_fields

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i # rubocop:disable Style/MutableConstant

  validates :username, :email_address, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }
  validates :email_address, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }

  private

  def normalize_fields
    self.email_address = email_address.to_s.downcase.strip
    self.username = username.to_s.downcase.strip
  end
end
