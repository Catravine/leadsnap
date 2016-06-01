class Admin::GoalsController < Admin::AdminController

  def index
    @goals = Goal.all
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      flash[:notice] = "Goal saved."
    else
      flash[:alert] = "There was an error saving this goal.  Please try again."
    end
    redirect_to admin_goals_path
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to admin_goals_path
  end

  private

  def goal_params
    params.require(:goal).permit(:amount, :weekly, :individual)
  end

end
