class SavingsGoalsController < ApplicationController
    before_action :set_savings_goal, only: [:show, :update, :destroy]
  
    def index
      @savings_goals = SavingsGoal.all
      render json: @savings_goals
    end
  
    def show
      render json: @savings_goal
    end
  
    def create
      @savings_goal = SavingsGoal.new(savings_goal_params)
  
      if @savings_goal.save
        render json: @savings_goal, status: :created
      else
        render json: @savings_goal.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @savings_goal.update(savings_goal_params)
        render json: @savings_goal
      else
        render json: @savings_goal.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @savings_goal.destroy
    end
  
    private
  
    def set_savings_goal
      @savings_goal = SavingsGoal.find(params[:id])
    end
  
    def savings_goal_params
      params.require(:savings_goal).permit(:amount)
    end
  end
  