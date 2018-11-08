class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @currencies = Currency.all
  end

  def clients
  end
end
