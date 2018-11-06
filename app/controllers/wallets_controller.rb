class WalletsController < ApplicationController
  def index
    @wallets = policy_scope(Wallet.where(user: current_user))
  end

  def show
    @wallet = Wallet.find(params[:id])
    @wallet.user = User.find(params[:user_id])
    authorize @wallet
  end

  def new
    @wallet = Wallet.new
    @wallet.user = User.find(params[:user_id])
    authorize @wallet
  end

  def create
    @wallet = Wallet.new(wallet_params)
    @wallet.user = User.find(params[:user_id])
    authorize @wallet
    if @wallet.save
      redirect_to [@wallet.user, @wallet]
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

  def wallet_params
    params.require(:wallet).permit(:amount, :user_id, :currency_id)
  end
end
