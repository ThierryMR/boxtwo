class WalletsController < ApplicationController
  def index
    @wallets = policy_scope(Wallet.where(user: current_user))
  end

  def show
    @wallet = Wallet.find(params[:id])
    @offer = @wallet.offers.new
    authorize @wallet
  end

  def new
    @wallet = Wallet.new
    @wallet.user = current_user
    authorize @wallet
  end

  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.user = current_user
    authorize @wallet
    if @wallet.save
      redirect_to @wallet
    else
      render :new
    end
  end

  def edit
    @wallet = Wallet.find(params[:id])
    authorize @wallet
  end

  def update
    @wallet = Wallet.find(params[:id])
    authorize @wallet
    @wallet.update(wallet_params)
    redirect_to @wallet
  end

  def destroy
    wallet = Wallet.find(params[:id])
    authorize wallet
    wallet.destroy
    redirect_to wallets_path
  end

  def wallet_params
    params.require(:wallet).permit(:amount, :user_id, :currency_id)
  end
end
