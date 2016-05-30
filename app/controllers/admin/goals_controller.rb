class Admin::GoalsController < Admin::AdminController

  def index
    @goals = Goal.all
  end

end
