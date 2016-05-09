class AddGoalPrivate < ActiveRecord::Migration
  def change
    add_column :goals, :goal_public, :boolean, default: false
  end
end
