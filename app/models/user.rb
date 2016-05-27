class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Default order alpha by nickname
  default_scope { order("users.nickname ASC") }

  before_save :set_nickname
  before_save { self.role ||= :standard }

  has_many :recalls, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :nos, dependent: :destroy

  enum role: [:standard, :manager, :admin]

  # Week-to-date running total of sales amounts
  def week_total
    Sale.where(date: Time.now.beginning_of_week..Time.now, user: self).sum("amount")
  end

  private

  def set_nickname
    self.nickname ||= email.split(/@/).first.humanize.titleize
  end

end
