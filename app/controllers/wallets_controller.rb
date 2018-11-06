class WalletsController < ApplicationController
  def index

  end

  def show
    @wallet = Wallet.find(params[:id])
    authorize @wallet
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
