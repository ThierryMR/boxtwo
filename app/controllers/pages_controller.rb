class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @currencies = Currency.all
    @offer = Offer.new
    @currency = Currency.new
    @currency_names = Currency.select(:name)
  end
end
