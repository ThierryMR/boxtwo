class CurrenciesController < ApplicationController
  def index
    @currencies = policy_scope(Currency)
  end

  def show
    @currency = Currency.find(params[:id])
    authorize @currency
  end
end
