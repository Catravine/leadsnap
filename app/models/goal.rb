class Goal < ActiveRecord::Base
  # Default: Weekly, non-individual, any project

  default_scope { order("goals.created_at DESC") }

  scope :current, -> { select { |goal| goal.deadline > Time.now } }
  scope :expired, -> { select { |goal| goal.deadline < Time.now } }

  delegate :name, to: :campaign, prefix: true

  # def deadline
  #   weekly ? (Date.today.sunday + 5).beginning_of_day : Date.tomorrow.beginning_of_day
  # end

  def deadline
    weekly ? self.created_at.sunday.beginning_of_day : self.created_at.end_of_day
  end

end
