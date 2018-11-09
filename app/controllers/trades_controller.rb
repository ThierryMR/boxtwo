class TradesController < ApplicationController
  def index
    @trade = policy_scope(Trade)
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @offer.closed = true
    @offer.save
    @trade = Trade.new
    @trade.offer = @offer
    @trade.user = current_user

    @wallet = Wallet.where(user: current_user, currency: @trade.offer.wallet.currency).first
    if @wallet.nil?
      @wallet = Wallet.new
      @wallet.currency = @trade.offer.wallet.currency
      @wallet.amount = @trade.offer.amount
      @wallet.user = current_user
      @wallet.save
    else
      @wallet.amount += @trade.offer.amount
      @wallet.save
    end

    authorize @trade
    if @trade.save
      redirect_to [@offer, @trade]
    else
      redirect_to @offer
    end
  end

  def show
    @trade = Trade.find(params[:id])
    @offer = Offer.find(@trade.offer_id)
    authorize @trade
  end

  def my_trades
    @trades = policy_scope(Trade)
    unless @trades.empty?
      @sell_trades = @trades.select do |trade|
        authorize trade
        trade.offer.wallet.user == current_user
      end

      @buy_trades = @trades.select do |trade|
        authorize trade
        trade.user == current_user
      end
    else
      authorize @trades
    end
  end
  def my_boughts
    @trades = policy_scope(Trade)
    unless @trades.empty?
      @trades = @trades.select do |trade|
        @authorize trade
      else
        trade.offer.wallet.user == current_user
      end
  end

  def index
  end

  def trade_params
    params.require(:trade).permit(:offer_id)
  end
end
