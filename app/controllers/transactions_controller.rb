class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def index
    user = User.find_by(id: session[:user_id])
    @transactions = user.transactions
    @total = 0
    if @transactions.size >= 1
      @transactions.each do |trans|
        @total += trans.total
      end
    end
  end

  def external_transactions
    
  end

  def new
    user = User.find_by(id: session[:user_id])
    @transaction = user.transactions.new
  end

  def create
    user = User.find_by(id: session[:user_id])
    @transaction = user.transactions.new(transaction_params)

    if @transaction.save
      redirect_to @transaction, notice: 'Transaction was successfully created.'
    else
      timeline_transactions
      render :new, alert: 'Transaction was not created.'
    end
  end

  def show
  end

  def edit
  end

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

  def timeline_transactions
    @timeline_transactions = Transaction.where(user: current_user).ordered_by_most_recent
  end

  def transaction_params
    params.require(:transaction).permit(:name, :total)
  end

  def set_transaction
    user = User.find_by(id: session[:user_id])
    @transaction = user.transactions.find(params[:id])
  end
end
