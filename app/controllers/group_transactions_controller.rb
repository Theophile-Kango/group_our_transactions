class GroupTransactionsController < ApplicationController
    def create
        Group_transaction.create(group_transactions_params)
        redirect_to @group
    end

    private
    def group_transactions_params
        params.require(:group_transaction).permit(:transaction_id, :group_id)
    end
end
