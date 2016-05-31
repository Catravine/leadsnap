class Sale < ActiveRecord::Base
  belongs_to :user
  belongs_to :lead

  # Week-to-date of whole Room
  def self.room_week_total
    Sale.where(date: Time.now.beginning_of_week..Time.now).sum("amount")
  end

  # Running daily total of whole Room
  def self.room_day_total
    Sale.where(date: Time.now.beginning_of_day..Time.now).sum("amount")
  end

end
