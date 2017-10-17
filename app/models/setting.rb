class Setting < ApplicationRecord
  before_save :encrypt_password

  validates :contact_email, :email, :password, :info, presence: true
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/i }

  attr_accessor :new_password

  private

  def encrypt_password
    self.password = Digest::MD5.hexdigest(new_password) if new_password.present?
  end
end
