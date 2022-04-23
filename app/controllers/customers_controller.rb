class CustomersController < ApplicationController
  def show
    # @customer = current_customer
    @customer = Customer.find(params[:id])
  end

  def edit
    # @customer = current_customer
    @customer = Customer.find(params[:id])
  end

  def update
    # @customer = current_customer
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer), notice: "You have updated customer successfully."
    else
      # render "public/customers/edit"
      @customer = Customer.find(params[:id])
      render "edit"
    end
  end

  def withdraw
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,:first_name_kana,:email,:post_number,:address,:telephone_number,:password)
  end

end
