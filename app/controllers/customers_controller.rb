class CustomersController < ApplicationController
  before_action :correct_customer
  before_action :authenticate_customer!
  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer), notice: "You have updated customer successfully."
    else
      @customer = current_customer
      render "edit"
    end
  end

  def withdraw
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,:first_name_kana,:email,:post_number,:address,:telephone_number,:password)
  end

  def correct_customer
    @customer = Customer.find(params[:id])
    if current_customer != @customer
      redirect_to customer_path(current_customer)
    end
  end

end
