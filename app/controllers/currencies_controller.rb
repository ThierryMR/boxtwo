class CurrenciesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :refresh]

  def index
    @currencies = policy_scope(Currency)
    @currencies = @currencies.order(id: :asc)
  end

  def show
    @currency = Currency.find(params[:id])
    authorize @currency
  end

  def refresh
    authorize Currency
    Currency.refresh
    redirect_to currencies_path
  end
end
