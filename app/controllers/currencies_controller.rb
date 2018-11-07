class CurrenciesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @currencies = policy_scope(Currency)
  end

  def show
    @currency = Currency.find(params[:id])
    authorize @currency
  end
end
