class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @offers = policy_scope(Offer)
  end

  def show
    @offer = Offer.find(params[:id])
    @trade = Trade.new
    @trade.offer = @offer
    # @transaction = @offer.trade.new
    # @transaction.status = "sell"
    authorize @offer
  end

  def create
    @wallet = Wallet.find(params[:wallet_id])
    @offer = Offer.new(offer_params)
    if @offer.amount <= @wallet.amount
      @wallet.amount -= @offer.amount
      @offer.wallet = @wallet
      @offer.user_type = "sell"
      @wallet.save
    end
    authorize @offer
    if @offer.save
      redirect_to @offer
    else
      redirect_to @wallet
    end
  end

  def destroy
    offer = Offer.find(params[:id])
    wallet = Wallet.find(offer.wallet_id)
    wallet.amount += offer.amount
    wallet.save
    authorize offer
    offer.destroy
    redirect_to offers_path
  end

  def offer_params
    params.require(:offer).permit(:user_type, :price, :amount, :wallet_id, :trade_id)
  end
end
