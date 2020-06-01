class GroupTransactionsController < ApplicationController
  def create
    GroupTransaction.create!(group_transactions_params)
    redirect_to groups_path, notice: 'Course was successfully attributed to teacher.'
  end

  def destroy
    group = Group.all.find_by(params[:id]).group_transactions.find_by(params[:id])
    GroupTransaction.all.delete(group.id)
    redirect_to groups_path, notice: 'Course was successfully removed to teacher.'
  end

  private

  def group_transactions_params
    params.require(:group_transaction).permit(:transaction_id, :group_id)
  end
end
