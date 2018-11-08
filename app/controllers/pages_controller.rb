class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @currencies = Currency.all
    @offer = Offer.new
    @currency = Currency.new
    @currency_names = Currency.select(:name)
    @user = current_user
  end

  def clients
  end
end
