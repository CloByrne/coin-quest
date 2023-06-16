class PocketMoneyController < ApplicationController
    before_action :set_pocket_money, only: [:show, :update, :destroy]
  
    def index
      @pocket_moneys = PocketMoney.all
      render json: @pocket_moneys
    end
  
    def show
      render json: @pocket_money
    end
  
    def create
      @pocket_money = PocketMoney.new(pocket_money_params)
  
      if @pocket_money.save
        render json: @pocket_money, status: :created
      else
        render json: @pocket_money.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @pocket_money.update(pocket_money_params)
        render json: @pocket_money
      else
        render json: @pocket_money.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @pocket_money.destroy
    end
  
    private
  
    def set_pocket_money
      @pocket_money = PocketMoney.find(params[:id])
    end
  
    def pocket_money_params
      params.require(:pocket_money).permit(:amount)
    end
  end
  