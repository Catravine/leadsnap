class Goal < ActiveRecord::Base
  # Default: Weekly, non-individual, any project

  default_scope { order("goals.created_at DESC") }

  delegate :name, to: :campaign, prefix: true

  def self.current
    select { |goal| goal.deadline > Time.now }
  end

  def self.expired
    select { |goal| goal.deadline < Time.now }
  end

  def deadline
    if weekly
      (Date.today.sunday + 5).beginning_of_day
    else
      Date.tomorrow.beginning_of_day
    end
  end

end
