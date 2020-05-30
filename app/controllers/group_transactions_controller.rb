class GroupTransactionsController < ApplicationController
  def create
    GroupTransaction.create!(group_transactions_params)
    redirect_to groups_path, notice: 'Course was successfully added.'
  end

  def destroy
    user = User.find_by(id: session[:user_id])
    trans = user.transactions
    trans.each do |tr|
      GroupTransaction.delete(tr.groups.find(params[:group_id]).id)
      break
    end

    redirect_to groups_path, notice: 'Course was successfully removed.'
  end

  private

  def group_transactions_params
    params.require(:group_transaction).permit(:transaction_id, :group_id)
  end
end
