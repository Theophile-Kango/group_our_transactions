class GroupTransactionsController < ApplicationController
    def create
        GroupTransaction.create!(group_transactions_params)
        redirect_to groups_path, notice: 'Group was successfully added.'
    end

    def destroy
        group = Group.find(params[:group_id])
        user = User.find_by(id: session[:user_id])
        user.transactions.delete(group)
        redirect_to groups_path, notice: 'Group was successfully removed.'
    end

    private
    def group_transactions_params
        params.require(:group_transaction).permit(:transaction_id, :group_id)
    end
end
