class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]

  def index
    @transactions = current_user.transactions.order('created_at DESC')
  end

  def external_transactions
    @transactions = current_user.transactions
  end

  def new
    @transaction = current_user.transactions.new
  end

  def create
    @transaction = current_user.transactions.new(transaction_params)

    if @transaction.save
      redirect_to @transaction, notice: 'Teacher was successfully created.'
    else
      render :new, alert: 'Teacher was not created.'
    end
  end

  def show; end

  def edit; end

  def update
    if @transaction.update(transaction_params)
      redirect_to @transaction, notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_url, notice: 'Transaction was successfully destroyed.'
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :total)
  end

  def set_transaction
    @transaction = current_user.transactions.find(params[:id])
  end
end
