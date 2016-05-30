class Sale < ActiveRecord::Base
  belongs_to :user
  belongs_to :lead


  def self.week_total
    where(date: Time.now.beginning_of_week..Time.now).sum("amount")
  end

  # Daily running total of sales amounts
  def self.today_total
    where(date: Time.now.beginning_of_day..Time.now).sum("amount")
  end

  # Week-to-date of whole Room
  def self.room_week_total
    where(date: Time.now.beginning_of_week..Time.now).sum("amount")
  end
end
