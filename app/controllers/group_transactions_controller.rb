class GroupTransactionsController < ApplicationController
    def create
        GroupTransaction.create!(group_transactions_params)
        redirect_to groups_path, notice: 'Group was successfully added.'
    end

    private
    def group_transactions_params
        params.require(:group_transaction).permit(:transaction_id, :group_id)
    end
end
