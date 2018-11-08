class TradesController < ApplicationController
    def index
    @trade = policy_scope(Trade)
  end

  def new
    @trade = Trade.new
    authorize @trade
  end

  def create
    @trade = Trade.new(trade_params)
    authorize @trade
    @trade.save
    redirect_to trade_path
  end

  def trade_params
    params.require(:trade).permit(:status, :user_id, :offer_id)
  end
end
