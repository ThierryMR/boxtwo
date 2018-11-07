class OffersController < ApplicationController
  def index
    @offers = policy_scope(Offer)
  end

  def show
  end

  def new
    @offer = Offer.new
    @offer.wallet = Wallet.find(params[:wallet_id])
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.wallet = Wallet.find(params[:wallet_id])
    authorize @offer
    if @offer.save
     redirect_to [@offer.wallet, @offer]
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def offer_params
    params.require(:offer).permit(:type, :price, :amount, :wallet_id, :transaction_id)
  end
end
