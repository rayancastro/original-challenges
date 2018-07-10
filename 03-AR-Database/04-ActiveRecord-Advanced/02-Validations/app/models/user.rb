class User < ActiveRecord::Base
  has_many :posts
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: /.*@.*\.com.*/, message: "is invalid" }
  before_validation :strip_email

  after_create do |user|
    FakeMailer.instance.mail(user.email, "#{user.username.capitalize}, welcome to Le Wagon")
  end

  protected

  def strip_email
    self.email = email.strip unless email.nil?
  end
end
