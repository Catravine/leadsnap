class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :set_nickname

  private

  def set_nickname
    self.nickname ||= email.split(/@/).first.humanize.titleize
  end

end
