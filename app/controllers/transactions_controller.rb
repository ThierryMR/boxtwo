class TransactionsController < ApplicationController
  def index
    @transactions = policy_scope(Transaction)
  end

  def new
    @transaction = Transaction.new
    authorize @transaction
  end

  def create
    @transaction = Transaction.new(transaction_params)
    authorize @transaction
    @transaction.save
    redirect_to transactions_path
  end

  def transaction_params
    params.require(:transaction).permit(:status, :user_id, :offer_id)
  end
end

