class TradesController < ApplicationController
    def index
    @trade = policy_scope(Trade)
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @trade = Trade.new
    @trade.offer = @offer
    @trade.user = current_user
    authorize @trade
    if @trade.save
      redirect_to [@offer, @trade]
    else
      redirect_to @offer
    end
  end

  def show
    @trade = Trade.find(params[:id])
    authorize @trade
  end

  def index
  end

  def trade_params
    params.require(:trade).permit(:offer_id)
  end
end
