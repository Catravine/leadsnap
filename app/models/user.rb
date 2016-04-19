class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :set_nickname
  before_save { self.role ||= :standard }

  enum role: [:standard, :manager, :admin]

  def approved_user
    self.approved = true
    ApprovalMailer.approved_user(self).deliver_now
  end

  private

  def set_nickname
    self.nickname ||= email.split(/@/).first.humanize.titleize
  end

end
