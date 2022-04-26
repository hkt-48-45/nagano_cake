class AddressesController < ApplicationController
  before_action :correct_address, only: [:edit, :update]
  before_action :authenticate_customer!

  def index
    @customer = current_customer
    @address = Address.new
    @address.customer_id = current_customer.id
    @addresses = Address.where(customer_id: @customer.id)
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path, notice: "You have created address successfully."
    else
      @customer = current_customer
      @addresses = Address.where(customer_id: @customer.id)
      render 'index'
    end
  end

  def edit
  end

  def update
    @address.customer_id = current_customer.id
    if @address.update(address_params)
      redirect_to addresses_path, notice: "You have updated customer successfully."
    else
      render "edit"
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      flash[:notice]="Address was successfully destroyed."
      redirect_to addresses_path
    end
  end

  private
  def address_params
    params.require(:address).permit(:name, :post_number, :address)
  end

  def correct_address
    @address = Address.find(params[:id])
    if current_customer != @address.customer
      redirect_to addresses_path
    end
  end

end
