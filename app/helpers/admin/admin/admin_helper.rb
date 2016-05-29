module Admin::Admin::AdminHelper

  def find_weekly_goal
    @current_set = Goal.where(weekly: true, individual: true).current
    @current_set != nil && @current_set.count > 0 ? @current_set.first.amount : 2500
  end

  def find_daily_goal
    @current_set = Goal.where(weekly: false, individual: true).current
    @current_set != nil && @current_set.count > 0 ? @current_set.first.amount : 500
  end

end
