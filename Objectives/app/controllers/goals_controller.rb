class GoalsController < ApplicationController
  def new

  end

  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      redirect_to user_url(@goal.user_id)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end


  private

  def goal_params
    params.require(:goal).permit(:user_id, :body)

  end
end
